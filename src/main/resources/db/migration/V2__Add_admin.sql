insert into usr (id, username, password, active, email)
  values (1, 'admin', '$2a$08$9GQWUA7I1QzmjAWB1QgsYOsI8RzcNwboQBMMh0kWyu2sC6jdmErGG', true, 'ark@next2cloud.info');

insert into user_role (user_id, roles)
  values (1, 'USER'), (1, 'ADMIN');