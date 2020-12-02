use sql_invoicing;


DELIMITER $$
create procedure get_clients()
begin
select * from clients;
end$$

DELIMITER ;

