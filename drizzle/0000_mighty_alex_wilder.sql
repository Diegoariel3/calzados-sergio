CREATE TABLE `order_items` (
	`id` text PRIMARY KEY NOT NULL,
	`order_id` text NOT NULL,
	`variant_id` text NOT NULL,
	`name` text NOT NULL,
	`color` text NOT NULL,
	`size` text NOT NULL,
	`price` integer NOT NULL,
	`quantity` integer NOT NULL,
	FOREIGN KEY (`order_id`) REFERENCES `orders`(`id`) ON UPDATE no action ON DELETE no action,
	FOREIGN KEY (`variant_id`) REFERENCES `variants`(`id`) ON UPDATE no action ON DELETE no action
);
--> statement-breakpoint
CREATE TABLE `orders` (
	`id` text PRIMARY KEY NOT NULL,
	`customer` text NOT NULL,
	`email` text NOT NULL,
	`phone` text NOT NULL,
	`delivery` text NOT NULL,
	`address` text DEFAULT '' NOT NULL,
	`notes` text DEFAULT '' NOT NULL,
	`status` text DEFAULT 'Pendiente' NOT NULL,
	`total` integer NOT NULL,
	`created_at` text NOT NULL,
	`request_key` text NOT NULL
);
--> statement-breakpoint
CREATE UNIQUE INDEX `orders_request_key_unique` ON `orders` (`request_key`);--> statement-breakpoint
CREATE TABLE `products` (
	`id` text PRIMARY KEY NOT NULL,
	`name` text NOT NULL,
	`description` text NOT NULL,
	`category` text NOT NULL,
	`brand` text DEFAULT '' NOT NULL,
	`audience` text DEFAULT 'Unisex' NOT NULL,
	`material` text DEFAULT '' NOT NULL,
	`price` integer NOT NULL,
	`compare_price` integer,
	`images` text NOT NULL,
	`active` integer DEFAULT 1 NOT NULL,
	`featured` integer DEFAULT 0 NOT NULL,
	`demo` integer DEFAULT 0 NOT NULL,
	`created_at` text NOT NULL
);
--> statement-breakpoint
CREATE TABLE `variants` (
	`id` text PRIMARY KEY NOT NULL,
	`product_id` text NOT NULL,
	`color` text NOT NULL,
	`hex` text NOT NULL,
	`size` text NOT NULL,
	`sku` text NOT NULL,
	`stock` integer NOT NULL,
	FOREIGN KEY (`product_id`) REFERENCES `products`(`id`) ON UPDATE no action ON DELETE no action
);
--> statement-breakpoint
CREATE UNIQUE INDEX `variants_sku_unique` ON `variants` (`sku`);