import type {Metadata} from 'next';
import './globals.css';
export const metadata:Metadata={title:'Calzado Sergio | Movete a tu manera',description:'Calzado deportivo, urbano e indumentaria. Explorá la tienda de Calzado Sergio, Roberts, Buenos Aires.'};
export default function Layout({children}:Readonly<{children:React.ReactNode}>){return <html lang="es-AR"><body>{children}</body></html>}
