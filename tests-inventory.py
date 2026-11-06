"""Regression checks for atomic inventory reservation and one-time cancellation release."""
import sqlite3,pathlib
c=sqlite3.connect(':memory:')
for f in sorted(pathlib.Path('drizzle').glob('*.sql')):c.executescript(f.read_text())
c.execute("INSERT INTO products VALUES ('p','Test','Demo','Running','','Unisex','',100,NULL,'[]',1,1,1,'now')")
c.execute("INSERT INTO variants VALUES ('v','p','Azul','#071b2b','40','TEST',3)")
c.commit()
def order(id,qty):
 with c:
  c.execute("INSERT INTO orders VALUES (?, 'Test','test@example.invalid','123456','Retiro en el local','','','Pendiente',100,'now',?)",(id,id))
  c.execute("INSERT INTO order_items VALUES (?, ?, 'v','Test','Azul','40',100,?)",(id,id,qty))
order('one',2)
assert c.execute("SELECT stock FROM variants").fetchone()[0]==1
try:order('two',2)
except sqlite3.IntegrityError:pass
else:raise AssertionError('oversell accepted')
assert c.execute("SELECT count(*) FROM orders WHERE id='two'").fetchone()[0]==0
with c:c.execute("UPDATE orders SET status='Cancelado' WHERE id='one'")
assert c.execute("SELECT stock FROM variants").fetchone()[0]==3
with c:c.execute("UPDATE orders SET status='Cancelado' WHERE id='one'")
assert c.execute("SELECT stock FROM variants").fetchone()[0]==3
try:
 with c:c.execute("UPDATE variants SET stock=-1 WHERE id='v'")
except sqlite3.IntegrityError:pass
else:raise AssertionError('negative inventory accepted')
print('PASS: reservation, oversell rollback, cancellation restoration, repeated cancellation, negative-stock guard')
