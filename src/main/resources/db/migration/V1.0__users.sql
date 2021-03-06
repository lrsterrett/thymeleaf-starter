-- https://docs.spring.io/spring-security/site/docs/current/reference/htmlsingle/#user-schema

create table `users` (
  username varchar(50) not null primary key,
  password varchar(60) not null,
  email varchar(255) not null,
  first_name varchar(120) not null,
  last_name varchar(120) not null,
  enabled boolean not null
);

create table `authorities` (
  username varchar(50) not null,
  authority varchar(50) not null,
  constraint fk_authorities_users foreign key(username) references users(username)
);
create unique index ix_auth_username on authorities (username,authority);

create table `user_groups` (
  id bigint auto_increment primary key,
  group_name varchar(50) not null,
  created_by varchar(50) not null,
  created_datetime timestamp(2) not null,
  last_modified_by varchar(50) not null,
  last_modified_datetime timestamp(2) not null,
  version smallint not null
);

create table `user_group_authorities` (
  group_id bigint not null,
  authority varchar(50) not null,
  constraint fk_group_authorities_group foreign key(group_id) references user_groups(id)
);

create table `user_group_members` (
  id bigint auto_increment primary key,
  username varchar(50) not null,
  group_id bigint not null,
  created_by varchar(50) not null,
  created_datetime timestamp(2) not null,
  last_modified_by varchar(50) not null,
  last_modified_datetime timestamp(2) not null,
  version smallint not null,
  constraint fk_group_members_group foreign key(group_id) references user_groups(id)
);