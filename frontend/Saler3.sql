-- Database creation and usage
CREATE DATABASE saler3;
USE saler3;


-- Re-enable foreign key checks
SET FOREIGN_KEY_CHECKS=1;

select p.product_name, p.availability
from product as p
join brandproduct  as bp
on p.product_id=bp.product_id
join brand as b
on b.brand_id=bp.brand_id
where b.brand_name="Apple";


ALTER TABLE brandproduct
DROP FOREIGN KEY brandproduct_ibfk_2;

ALTER TABLE brandproduct
ADD CONSTRAINT brandproduct_ibfk_2
FOREIGN KEY (product_id) REFERENCES product(product_id) ON DELETE CASCADE;


alter table product 
drop product_image;









