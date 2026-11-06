CREATE TRIGGER order_stock_guard BEFORE INSERT ON order_items BEGIN
 SELECT CASE WHEN NEW.quantity < 1 OR (SELECT stock FROM variants WHERE id=NEW.variant_id) < NEW.quantity THEN RAISE(ABORT,'stock insuficiente') END;
END;
--> statement-breakpoint
CREATE TRIGGER order_stock_reserve AFTER INSERT ON order_items BEGIN
 UPDATE variants SET stock=stock-NEW.quantity WHERE id=NEW.variant_id;
END;
--> statement-breakpoint
CREATE TRIGGER order_stock_release AFTER UPDATE OF status ON orders WHEN NEW.status='Cancelado' AND OLD.status!='Cancelado' BEGIN
 UPDATE variants SET stock=stock+COALESCE((SELECT SUM(quantity) FROM order_items WHERE order_id=NEW.id AND variant_id=variants.id),0) WHERE id IN (SELECT variant_id FROM order_items WHERE order_id=NEW.id);
END;
--> statement-breakpoint
CREATE TRIGGER nonnegative_stock_insert BEFORE INSERT ON variants WHEN NEW.stock < 0 BEGIN SELECT RAISE(ABORT,'stock negativo'); END;
--> statement-breakpoint
CREATE TRIGGER nonnegative_stock_update BEFORE UPDATE OF stock ON variants WHEN NEW.stock < 0 BEGIN SELECT RAISE(ABORT,'stock negativo'); END;
