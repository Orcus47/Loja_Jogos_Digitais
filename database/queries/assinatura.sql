CREATE TABLE assinatura (
  assinatura_id int NOT NULL AUTO_INCREMENT,
  assinatura_tipo varchar(15),
  PRIMARY KEY (assinatura_id)
);

INSERT INTO assinatura VALUES
(1,'mensal'),
(2,'anual');
