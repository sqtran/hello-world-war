
CREATE user 'user'@'%' IDENTIFIED BY 'password';
GRANT ALL PRIVILEGES ON * . * TO 'user'@'%';

CREATE TABLE IF NOT EXISTS people (
    p_id INT AUTO_INCREMENT PRIMARY KEY,
    first_name VARCHAR(255) NOT NULL,
    last_name VARCHAR(255) NOT NULL,
    description TEXT,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
)  ENGINE=INNODB;

insert into people values(null, "Kirk", "Van Houten", "Can I Borrow A Feeling", null);
insert into people values(null, "Luann", "Van Houten", null, null);
insert into people values(null, "Milhouse", "Van Houten", null, null);
insert into people values(null, "Homer", "Simpson", null, null);
insert into people values(null, "Marge", "Simpson", null, null);
insert into people values(null, "Bart", "Simpson", null, null);
insert into people values(null, "Lisa", "Simpson", null, null);
insert into people values(null, "Maggie", "Simpson", "The baby", null);
insert into people values(null, "Clancy", "Wiggum", "A cop", null);
insert into people values(null, "Sarah", "Wiggum", null, null);
insert into people values(null, "Ralph", "Wiggum", null, null);

