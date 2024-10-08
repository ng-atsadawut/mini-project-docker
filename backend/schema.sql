CREATE SCHEMA IF NOT EXISTS public;

CREATE TABLE IF NOT EXISTS public.product (
  product_id SERIAL PRIMARY KEY,
  product_name VARCHAR(255) NOT NULL,
  product_price DECIMAL NOT NULL,
  product_quantity INT NOT NULL,
  product_image_url TEXT
);

INSERT INTO public.product ("product_id", "product_name", "product_price", "product_quantity", "product_image_url") VALUES (1, 'Example Product', '19.99', 50, 'https://b2dmain-ruk.cdn.jelastic.net/wp-content/uploads/2019/09/sqr_arduino.png.webp');
INSERT INTO public.product ("product_id", "product_name", "product_price", "product_quantity", "product_image_url") VALUES (2, 'Example Product', '19.99', 50, 'https://b2dmain-ruk.cdn.jelastic.net/wp-content/uploads/2019/09/sqr_arduino.png.webp');
INSERT INTO public.product ("product_id", "product_name", "product_price", "product_quantity", "product_image_url") VALUES (3, 'Example Product', '19.99', 50, 'https://b2dmain-ruk.cdn.jelastic.net/wp-content/uploads/2019/09/sqr_arduino.png.webp');
INSERT INTO public.product ("product_id", "product_name", "product_price", "product_quantity", "product_image_url") VALUES (4, 'Example Product', '19.99', 50, 'https://b2dmain-ruk.cdn.jelastic.net/wp-content/uploads/2019/09/sqr_arduino.png.webp');
INSERT INTO public.product ("product_id", "product_name", "product_price", "product_quantity", "product_image_url") VALUES (5, 'Example Product', '19.99', 50, 'https://b2dmain-ruk.cdn.jelastic.net/wp-content/uploads/2019/09/sqr_arduino.png.webp');
INSERT INTO public.product ("product_id", "product_name", "product_price", "product_quantity", "product_image_url") VALUES (6, 'Example Product', '19.99', 50, 'https://b2dmain-ruk.cdn.jelastic.net/wp-content/uploads/2019/09/sqr_arduino.png.webp');

