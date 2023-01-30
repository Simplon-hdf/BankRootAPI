#Ma base de données : 

DROP TABLE IF EXISTS User;
CREATE TABLE User(
        id     Auto_increment (25),
        user_id     Varchar (255),
        name_user     Varchar (25),
        first_name_user     Varchar (50),
        phone_number_user     Varchar (30),
        PRIMARY KEY (id)
)ENGINE=InnoDB;



DROP TABLE IF EXISTS Bank_account;
CREATE TABLE Bank_account(
        id     Auto_increment (25),
        bank_account_id     Varchar (255),
        RIB     Varchar (255),
        password     Varchar (255),
        balance     Float (25),
        operation     Text (25),
        beneficiaries     Text (25),
        id_User     Auto_increment (25),
        id_Bank     Auto_increment (25),
        PRIMARY KEY (id)
)ENGINE=InnoDB;



DROP TABLE IF EXISTS Bank;
CREATE TABLE Bank(
        id     Auto_increment (25),
        bank_id     Varchar (25),
        name_bank     Varchar (255),
        adress_bank     Varchar (25),
        phone_number_bank     Varchar (25),
        PRIMARY KEY (id)
)ENGINE=InnoDB;



DROP TABLE IF EXISTS Operation_bank;
CREATE TABLE Operation_bank(
        id     Auto_increment (25),
        operation_bank_id     Varchar (25),
        amount     Float (25),
        operation_state     Bool (25),
        operation_type     Varchar (25),
        id_Bank_account     Auto_increment (25),
        PRIMARY KEY (id)
)ENGINE=InnoDB;



DROP TABLE IF EXISTS action_request;
CREATE TABLE action_request(
        id     Auto_increment (25),
        type     Text (25),
        state     Bool (25),
        id_Bank_account     Auto_increment (25),
        id_User     Auto_increment (25),
        PRIMARY KEY (id)
)ENGINE=InnoDB;



ALTER TABLE Bank_account ADD CONSTRAINT FK_Bank_account_id_User FOREIGN KEY (id_User) REFERENCES User(id)
ALTER TABLE Bank_account ADD CONSTRAINT FK_Bank_account_id_Bank FOREIGN KEY (id_Bank) REFERENCES Bank(id)
ALTER TABLE Operation_bank ADD CONSTRAINT FK_Operation_bank_id_Bank_account FOREIGN KEY (id_Bank_account) REFERENCES Bank_account(id)
ALTER TABLE action_request ADD CONSTRAINT FK_action_request_id_Bank_account FOREIGN KEY (id_Bank_account) REFERENCES Bank_account(id)
ALTER TABLE action_request ADD CONSTRAINT FK_action_request_id_User FOREIGN KEY (id_User) REFERENCES User(id)
