# Calzado Sergio — tienda y administración

React 19 + TypeScript, Vinext, Workers, Cloudflare D1/Drizzle y R2. Paleta del cliente y referencia editorial Amble. La versión inicial usa acceso privado del propietario mediante ChatGPT.

## Rutas
- `/`: catálogo, búsqueda, filtro por talle/categoría/stock, orden de precio, producto con galería y variantes, bolsa persistente.
- `/admin`: alta/edición, carga de fotos, precios/ofertas, publicación, destacados, stock por SKU y gestión de pedidos.
- `/api/store/*`: API validada en servidor. Totales siempre calculados desde la base, nunca desde el navegador.

## Empezar
Abrir Administración e importar los productos de muestra para probar, o crear un producto real con una foto y al menos una variante. La primera foto es la portada. Cada variante tiene color, muestra hexadecimal, talle, SKU único y stock. Las variantes existentes se conservan para mantener el historial: usar stock cero para retirarlas. Desmarcar Visible en tienda para archivar un producto sin perder historial.

El catálogo inicial vacío muestra ejemplos virtuales sin permitir pedidos hasta que se importen o creen productos en la base. Los precios de muestra son ficticios. Reemplazar muestras por inventario real antes del lanzamiento.

## Pedidos
Nombre, email, teléfono, retiro/envío, dirección y comentario. No se cobra dinero ni se envían emails automáticamente. Cada pedido reserva stock con triggers SQL dentro del batch transaccional. Si falta stock, se revierte el pedido completo. La cancelación repone unidades una sola vez. Los pedidos Entregados y Cancelados quedan cerrados. La clave de solicitud evita duplicaciones al reintentar.

## Seguridad y lanzamiento público
Esta entrega es privada y usa la barrera de acceso del propietario del hosting. La API administrativa exige identidad verificada. **Antes de cambiar la audiencia a pública**, configurar obligatoriamente `ADMIN_EMAIL` como variable secreta del servidor, con el email exacto del administrador, y verificar rechazo de otras cuentas. No abrir la audiencia sin ese paso. Incorporar antes del lanzamiento: inventario/fotos propios o con permiso, contacto del local, condiciones comerciales y privacidad aplicables, dominio y acceso del cliente. Pedidos pendientes deben cancelarse manualmente si vencen; no hay expiración automática.

## Desarrollo y validación
Instalar usando el helper Sites, generar schema con `npm run db:generate`; aplicar migraciones locales en orden con Wrangler según documentación del starter. Compilar con `node <sites-plugin>/scripts/build-site.mjs`. `node node_modules/typescript/bin/tsc --noEmit` comprueba tipos; `python tests-inventory.py` prueba reserva, rollback ante sobreventa, devolución por cancelación y stock no negativo. Publicación aplica migraciones D1 y configura R2. No guardar claves en repositorio.

## Activos de muestra
`public/images/daily.webp`, `float.webp` y `court.webp`: Amble, https://amble.framer.media/ y sus URLs de framerusercontent, usados exclusivamente en esta vista privada de referencia; reemplazar antes de publicación comercial. `remera.jpg`: Unsplash https://images.unsplash.com/photo-1521572163474-6864f9cf17ab . Fuentes DM Sans y Barlow Condensed, Google Fonts (archivos autoalojados), licencias OFL en sus repositorios oficiales. El logotipo tipográfico es una propuesta, no el logotipo verificado del comercio.
