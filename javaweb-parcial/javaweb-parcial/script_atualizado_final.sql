CREATE DATABASE javaweb;
USE javaweb;

CREATE TABLE tb_estado (
	id_estado int primary key auto_increment,
    nome_estado varchar(100),
    sigla_estado char(2)
);

CREATE TABLE tb_cidade (
	id_cidade int primary key auto_increment,
    nome_cidade varchar(100),
    id_estado int,
    FOREIGN KEY (id_estado) REFERENCES tb_estado(id_estado)
);

CREATE TABLE tb_perfil(
	id_perfil int primary key auto_increment,
    nome_perfil varchar(30)
);

INSERT INTO tb_perfil(nome_perfil) VALUES
("cliente"),
("funcionario"),
("gerente");

CREATE TABLE tb_usuario(
	id_usuario int primary key auto_increment,
    cpf_usuario char(11) unique,
    nome_usuario varchar(100),
    email_usuario varchar(100) unique,
    senha_usuario varchar(100),
    tel_usuario varchar(100),
    rua_usuario varchar(100),
    bairro_usuario varchar(100),
    nr_usuario int,
    cep_usuario char(8),
    complemento_usuario varchar(50),
    id_cidade int,
    id_perfil int,
    FOREIGN KEY (id_cidade) REFERENCES tb_cidade(id_cidade),
    FOREIGN KEY (id_perfil) REFERENCES tb_perfil(id_perfil)
);


CREATE TABLE tb_categoria(
	id_categoria int primary key auto_increment,
    nome_categoria varchar(100)
);

INSERT INTO tb_categoria(nome_categoria) VALUES
('Perfumes'),
('Maquiagem'),
('Pele');
    
CREATE TABLE tb_produto(
	id_produto int primary key auto_increment,
    nome_produto varchar(100),
    desc_produto varchar(100),
    peso_produto decimal(20,2),
	id_categoria int,
    FOREIGN KEY (id_categoria) REFERENCES tb_categoria_produto(id_categoria)
);

CREATE TABLE tb_tipo_atendimento(
	id_tipo_atendimento int primary key auto_increment,
    nome_tipo_atendimento varchar(50)
);

CREATE TABLE tb_atendimento(
	id_atendimento int primary key auto_increment,
    dt_hr_atendimento datetime,
    dsc_atendimento varchar(255),
    id_tipo_atendimento int,
    id_cliente int,
    res_atendimento char(1),
    id_produto int,
    solucao_atendimento varchar(1200),
    foreign key (id_tipo_atendimento) references tb_tipo_atendimento (id_tipo_atendimento),
	foreign key (id_cliente) references tb_cliente (id_cliente),
    foreign key (id_produto) references tb_produto (id_produto)
);



Insert into tb_estado (nome_estado, sigla_estado) values ('Acre', 'AC');
Insert into tb_estado (nome_estado, sigla_estado) values ('Alagoas', 'AL');
Insert into tb_estado (nome_estado, sigla_estado) values ('Amapá', 'AP');
Insert into tb_estado (nome_estado, sigla_estado) values ('Amazonas', 'AM');
Insert into tb_estado (nome_estado, sigla_estado) values ('Bahia', 'BA');
Insert into tb_estado (nome_estado, sigla_estado) values ('Ceará', 'CE');
Insert into tb_estado (nome_estado, sigla_estado) values ('Distrito Federal', 'DF');
Insert into tb_estado (nome_estado, sigla_estado) values ('Espírito Santo', 'ES');
Insert into tb_estado (nome_estado, sigla_estado) values ('Goiás', 'GO');
Insert into tb_estado (nome_estado, sigla_estado) values ('Maranhão', 'MA');
Insert into tb_estado (nome_estado, sigla_estado) values ('Mato Grosso', 'MT');
Insert into tb_estado (nome_estado, sigla_estado) values ('Mato Grosso do Sul', 'MS');
Insert into tb_estado (nome_estado, sigla_estado) values ('Minas Gerais', 'MG');
Insert into tb_estado (nome_estado, sigla_estado) values ('Pará', 'PA');
Insert into tb_estado (nome_estado, sigla_estado) values ('Paraíba', 'PB');
Insert into tb_estado (nome_estado, sigla_estado) values ('Paraná', 'PR');
Insert into tb_estado (nome_estado, sigla_estado) values ('Pernambuco', 'PE');
Insert into tb_estado (nome_estado, sigla_estado) values ('Piauí', 'PI');
Insert into tb_estado (nome_estado, sigla_estado) values ('Rio de Janeiro', 'RJ');
Insert into tb_estado (nome_estado, sigla_estado) values ('Rio Grande do Norte', 'RN');
Insert into tb_estado (nome_estado, sigla_estado) values ('Rio Grande do Sul', 'RS');
Insert into tb_estado (nome_estado, sigla_estado) values ('Rondônia', 'RO');
Insert into tb_estado (nome_estado, sigla_estado) values ('Roraima', 'RR');
Insert into tb_estado (nome_estado, sigla_estado) values ('Santa Catarina', 'SC');
Insert into tb_estado (nome_estado, sigla_estado) values ('São Paulo', 'SP');
Insert into tb_estado (nome_estado, sigla_estado) values ('Sergipe', 'SE');
Insert into tb_estado (nome_estado, sigla_estado) values ('Tocantins', 'TO');


INSERT INTO tb_cidade (nome_cidade, id_estado) VALUES
('Bujari', 1),
( 'Capixaba', 1),
( 'Cruzeiro do Sul', 1),
( 'Epitaciolândia', 1),
('Feijó', 1),
('Jordão', 1),
('Mâncio Lima', 1),
('Manoel Urbano', 1),
('Marechal Thaumaturgo', 1),
( 'Plácido de Castro', 1),
('Porto Acre', 1),
('Porto Walter', 1),
('Rio Branco', 1),
('Rodrigues Alves', 1),
('Santa Rosa do Purus', 1),
('Sena Madureira', 1),
('Senador Guiomard', 1),
('Tarauacá', 1),
('Xapuri', 1),
('Água Branca', 2),
('Anadia', 2),
('Arapiraca', 2),
('Atalaia', 2),
('Barra de Santo Antônio', 2),
('Barra de São Miguel', 2),
('Batalha', 2),
('Belém', 2),
('Belo Monte', 2),
('Boca da Mata', 2),
('Branquinha', 2),
('Cacimbinhas', 2),
('Cajueiro', 2),
('Boca do Acre', 3),
('Borba', 3),
('Caapiranga', 3),
('Canutama', 3),
('Carauari', 3),
('Careiro', 3),
('Careiro da Várzea', 3),
('Coari', 3),
('Codajás', 3),
('Eirunepé', 3),
('Envira', 3),
('Laranjal do Jari', 4),
('Macapá', 4),
('Mazagão', 4),
('Oiapoque', 4),
('Pedra Branca do Amaparí', 4),
('Porto Grande', 4),
('Pracuúba', 4),
('Santana', 4),
('Serra do Navio', 4),
('Tartarugalzinho', 4),
('Vitória do Jari', 4),
('Alcobaça', 5),
('Almadina', 5),
('Amargosa', 5),
('Amélia Rodrigues', 5),
('América Dourada', 5),
('Anagé', 5),
('Andaraí', 5),
('Andorinha', 5),
('Angical', 5),
('Anguera', 5),
('Antas', 5),
('Aratuba', 6),
( 'Arneiroz', 6),
('Assaré', 6),
('Aurora', 6),
('Baixio', 6),
('Banabuiú', 6),
('Barbalha', 6),
('Barreira', 6),
('Barro', 6),
('Barroquinha', 6),
('Baturité', 6),
('Beberibe', 6),
('Brasília', 7),
('Afonso Cláudio', 8),
('Água Doce do Norte', 8),
('Águia Branca', 8),
('Alegre', 8),
('Alfredo Chaves', 8),
('Alto Rio Novo', 8),
('Anchieta', 8),
('Apiacá', 8),
('Aracruz', 8),
( 'Atilio Vivacqua', 8),
('Baixo Guandu', 8),
('Abadia de Goiás', 9),
( 'Abadiânia', 9),
( 'Acreúna', 9),
('Adelândia', 9),
('Água Fria de Goiás', 9),
('Água Limpa', 9),
('Águas Lindas de Goiás', 9),
('Alexânia', 9),
('Aloândia', 9),
('Alto Horizonte', 9),
( 'Alto Paraíso de Goiás', 9),
( 'Alvorada do Norte', 9),
( 'Amaralina', 9),
( 'Americano do Brasil', 9),
( 'Afonso Cunha', 10),
( 'Água Doce do Maranhão', 10),
('Alcântara', 10),
('Aldeias Altas', 10),
('Altamira do Maranhão', 10),
( 'Alto Alegre do Maranhão', 10),
('Alto Alegre do Pindaré', 10),
('Alto Parnaíba', 10),
( 'Amapá do Maranhão', 10),
( 'Amarante do Maranhão', 10),
( 'Anajatuba', 10),
( 'Anapurus', 10),
( 'Apicum-Açu', 10),
('Angelândia', 11),
( 'Antônio Carlos', 11),
('Antônio Dias', 11),
('Antônio Prado de Minas', 11),
( 'Araçaí', 11),
( 'Aracitaba', 11),
( 'Araçuaí', 11),
( 'Araguari', 11),
( 'Arantina', 11),
( 'Araponga', 11),
( 'Araporã', 11),
( 'Costa Rica', 12),
( 'Coxim', 12),
( 'Deodápolis', 12),
( 'Eldorado', 12),
( 'Fátima do Sul', 12),
( 'Figueirão', 12),
( 'Glória de Dourados', 12),
( 'Guia Lopes da Laguna', 12),
( 'Iguatemi', 12),
( 'Apiacás', 13),
( 'Araguaiana', 13),
( 'Araguainha', 13),
( 'Araputanga', 13),
('Arenápolis', 13),
( 'Aripuanã', 13),
( 'Barão de Melgaço', 13),
( 'Barra do Bugres', 13),
( 'Barra do Garças', 13),
('Bom Jesus do Araguaia', 13),
('Brasnorte', 13),
( 'Cáceres', 13),
( 'Campinápolis', 13),
( 'Campo Novo do Parecis', 13),
( 'Ponta de Pedras', 14),
( 'Portel', 14),
( 'Porto de Moz', 14),
( 'Prainha', 14),
('Primavera', 14),
( 'Quatipuru', 14),
( 'Redenção', 14),
( 'Rio Maria', 14),
( 'Rondon do Pará', 14),
('Rurópolis', 14),
( 'Salinópolis', 14),
( 'Gurjão', 15),
( 'Ibiara', 15),
( 'Igaracy', 15),
( 'Imaculada', 15),
( 'Ingá', 15),
( 'Itabaiana', 15),
('Itaporanga', 15),
('Itapororoca', 15),
('Itatuba', 15),
( 'Jacaraú', 15),
('Jericó', 15),
('João Pessoa', 15),
('Inajá', 16),
( 'Ingazeira', 16),
('Ipojuca', 16),
('Ipubi', 16),
('Itacuruba', 16),
('Itaíba', 16),
('Itambé', 16),
( 'Itapetim', 16),
('Itapissuma', 16),
('Itaquitinga', 16),
('Alegrete do Piauí', 17),
('Alto Longá', 17),
('Altos', 17),
('Alvorada do Gurguéia', 17),
('Amarante', 17),
('Angical do Piauí', 17),
('Anísio de Abreu', 17),
('Antônio Almeida', 17),
('Aroazes', 17),
('Aroeiras do Itaim', 17),
('Borrazópolis', 18),
( 'Braganey', 18),
( 'Brasilândia do Sul', 18),
( 'Cafeara', 18),
( 'Cafelândia', 18),
( 'Cafezal do Sul', 18),
( 'Califórnia', 18),
('Candói', 18),
('Cambará', 18),
('Cascavel', 18),
( 'Itaocara', 19),
( 'Itaperuna', 19),
( 'Itatiaia', 19),
('Japeri', 19),
( 'Laje do Muriaé', 19),
( 'Macaé', 19),
('Macuco', 19),
( 'Magé', 19),
('Mangaratiba', 19),
( 'Maricá', 19),
( 'Mendes', 19),
('Frutuoso Gomes', 20),
('Galinhos', 20),
( 'Goianinha', 20),
( 'Governador Dix-Sept Rosado', 20),
( 'Grossos', 20),
('Guamaré', 20),
( 'Ielmo Marinho', 20),
( 'Ipanguaçu', 20),
( 'Ipueira', 20),
( 'Itajá', 20),
('Ariquemes', 21),
('Buritis', 21),
('Cabixi', 21),
('Cacaulândia', 21),
('Cacoal', 21),
('Campo Novo de Rondônia', 21),
('Candeias do Jamari', 21),
('Castanheiras', 21),
('Cerejeiras', 21),
('Chupinguaia', 21),
('Alto Alegre', 22),
('Amajari', 22),
('Boa Vista', 22),
('Bonfim', 22),
('Cantá', 22),
('Caracaraí', 22),
( 'Caroebe', 22),
('Iracema', 22),
( 'Mucajaí', 22),
( 'Normandia', 22),
( 'Pacaraima', 22),
( 'Boa Vista do Cadeado', 23),
( 'Boa Vista do Incra', 23),
( 'Boa Vista do Sul', 23),
('Bom Jesus', 23),
('Bom Princípio', 23),
('Bom Progresso', 23),
( 'Bom Retiro do Sul', 23),
( 'Boqueirão do Leão', 23),
( 'Bossoroca', 23),
( 'Bozano', 23),
('Caçador', 24),
('Caibi', 24),
('Calmon', 24),
( 'Camboriú', 24),
( 'Campo Alegre', 24),
('Campo Belo do Sul', 24),
('Campo Erê', 24),
( 'Campos Novos', 24),
('Canelinha', 24),
( 'Canoinhas', 24),
( 'Capão Alto', 24),
('Itaporanga dAjuda', 25),
( 'Japaratuba', 25),
( 'Japoatã', 25),
('Lagarto', 25),
('Laranjeiras', 25),
( 'Macambira', 25),
('Malhada dos Bois', 25),
( 'Malhador', 25),
( 'Maruim', 25),
( 'Moita Bonita', 25),
('Adamantina', 26),
('Adolfo', 26),
('Aguaí', 26),
('Águas da Prata', 26),
('Águas de Lindóia', 26),
('Águas de Santa Bárbara', 26),
('Águas de São Pedro', 26),
( 'Agudos', 26),
( 'Alambari', 26),
( 'Alfredo Marcondes', 26),
('Altair', 26),
( 'Dueré', 27),
('Esperantina', 27),
('Fátima', 27),
('Figueirópolis', 27),
( 'Filadélfia', 27),
('Formoso do Araguaia', 27),
('Fortaleza do Tabocão', 27),
( 'Goianorte', 27),
( 'Goiatins', 27),
( 'Guaraí', 27),
( 'Gurupi', 27);


insert into tb_usuario (cpf_usuario, nome_usuario, email_usuario, senha_usuario, tel_usuario, rua_usuario, bairro_usuario, nr_usuario, cep_usuario, complemento_usuario, id_cidade, id_perfil) values ('45912083624', 'Trip Dyster', 'master@gmail.com', '202cb962ac59075b964b07152d234b70', '345-743-4289', 'Hazelcrest', 'Parkway', '49', '03326181', 'iaculis', 63, 2);


insert into tb_produto (nome_produto, desc_produto, peso_produto, id_categoria) values ('NITROGEN', 'mi nulla ac enim in tempor turpis nec', 397.79, 2);
insert into tb_produto (nome_produto, desc_produto, peso_produto, id_categoria) values ('Nitroglycerin', 'pulvinar lobortis est phasellus', 129.46, 2);
insert into tb_produto (nome_produto, desc_produto, peso_produto, id_categoria) values ('RANITIDINE', 'morbi a ipsum integer a', 178.65, 1);
insert into tb_produto (nome_produto, desc_produto, peso_produto, id_categoria) values ('AZELEX', 'at turpis a pede posuere nonummy', 787.75, 1);
insert into tb_produto (nome_produto, desc_produto, peso_produto, id_categoria) values ('CENTER-AL - PHLEUM PRATENSE POLLEN', 'cras in', 431.02, 3);
insert into tb_produto (nome_produto, desc_produto, peso_produto, id_categoria) values ('Clobetasol Propionate', 'mauris vulputate elementum nullam varius nulla', 725.77, 2);
insert into tb_produto (nome_produto, desc_produto, peso_produto, id_categoria) values ('Lovastatin', 'justo etiam pretium iaculis', 525.62, 1);
insert into tb_produto (nome_produto, desc_produto, peso_produto, id_categoria) values ('Promethazine Hydrochloride and Dextromethorphan Hydrobromide', 'mattis nibh ligula', 95.95, 2);
insert into tb_produto (nome_produto, desc_produto, peso_produto, id_categoria) values ('Naproxen Sodium', 'velit vivamus', 849.33, 2);
insert into tb_produto (nome_produto, desc_produto, peso_produto, id_categoria) values ('Diltiazem Hydrochloride', 'massa id lobortis', 175.05, 3);
insert into tb_produto (nome_produto, desc_produto, peso_produto, id_categoria) values ('Stressa Back and Neck Pain Relieving', 'et commodo', 495.8, 3);
insert into tb_produto (nome_produto, desc_produto, peso_produto, id_categoria) values ('Duloxetine', 'eros suspendisse accumsan tortor quis turpis sed ante vivamus', 154.47, 1);
insert into tb_produto (nome_produto, desc_produto, peso_produto, id_categoria) values ('HealthMart Mucus Relief FM', 'vestibulum vestibulum ante ipsum primis in faucibus orci', 161.39, 3);
insert into tb_produto (nome_produto, desc_produto, peso_produto, id_categoria) values ('Prometrium', 'curae donec pharetra magna vestibulum', 169.95, 2);
insert into tb_produto (nome_produto, desc_produto, peso_produto, id_categoria) values ('BestHealth Cough Suppressant SUGAR FREE BLACK CHERRY FLAVOR', 'congue diam id ornare imperdiet sapien urna', 30.35, 2);
insert into tb_produto (nome_produto, desc_produto, peso_produto, id_categoria) values ('Liver Detox', 'diam vitae quam', 370.12, 3);
insert into tb_produto (nome_produto, desc_produto, peso_produto, id_categoria) values ('BC', 'dictumst morbi vestibulum velit', 924.82, 3);
insert into tb_produto (nome_produto, desc_produto, peso_produto, id_categoria) values ('Medical Provider Single Use EZ Flu Shot 2013-2014', 'sapien ut nunc', 812.56, 2);
insert into tb_produto (nome_produto, desc_produto, peso_produto, id_categoria) values ('Epinephrine', 'blandit nam nulla integer pede justo', 302.75, 3);
insert into tb_produto (nome_produto, desc_produto, peso_produto, id_categoria) values ('White Hickory', 'libero ut massa volutpat convallis morbi odio odio elementum eu', 934.05, 2);
insert into tb_produto (nome_produto, desc_produto, peso_produto, id_categoria) values ('NITROGEN', 'lacinia sapien quis libero nullam sit amet turpis', 516.3, 1);
insert into tb_produto (nome_produto, desc_produto, peso_produto, id_categoria) values ('Topiclear Skin Lightening', 'odio consequat varius integer ac leo pellentesque ultrices mattis odio', 248.93, 2);
insert into tb_produto (nome_produto, desc_produto, peso_produto, id_categoria) values ('Freshmint Anticavity Fluoride Gel Toothpaste', 'ac enim in tempor turpis nec euismod scelerisque quam', 907.34, 3);
insert into tb_produto (nome_produto, desc_produto, peso_produto, id_categoria) values ('Amitriptyline Hydrochloride', 'sociis natoque penatibus et magnis', 278.28, 1);
insert into tb_produto (nome_produto, desc_produto, peso_produto, id_categoria) values ('Nystatin', 'at vulputate vitae nisl aenean lectus pellentesque eget nunc donec', 929.77, 3);
insert into tb_produto (nome_produto, desc_produto, peso_produto, id_categoria) values ('Lisinopril and Hydrochlorothiazide', 'posuere felis sed lacus', 95.5, 2);
insert into tb_produto (nome_produto, desc_produto, peso_produto, id_categoria) values ('LOreal Paris Ideal Moisture Normal Skin Broad Spectrum SPF 25 Sunscreen', 'ornare imperdiet sapien urna pretium nisl ut volutpat sapien', 60.61, 2);
insert into tb_produto (nome_produto, desc_produto, peso_produto, id_categoria) values ('Pioglitazone and metformin', 'non mi integer ac', 44.87, 1);
insert into tb_produto (nome_produto, desc_produto, peso_produto, id_categoria) values ('Ampicillin and Sulbactam', 'orci mauris lacinia', 754.66, 1);
insert into tb_produto (nome_produto, desc_produto, peso_produto, id_categoria) values ('LAMB', 'sed justo pellentesque viverra pede ac diam cras', 616.78, 1);


CREATE TABLE tb_tipo_atendimento(
	id_tipo_atendimento int primary key auto_increment,
    nome_tipo_atendimento varchar(50)
);

INSERT INTO tb_tipo_atendimento(nome_tipo_atendimento) VALUES
("Informações"),
("Reclamações"),
("Elogios"),
("Sugestões");




insert into tb_atendimento (dt_hr_atendimento, dsc_atendimento, id_tipo_atendimento, id_cliente, res_atendimento, id_produto, solucao_atendimento) values ('2018-02-09 08:52:20', 'nulla ut', 2.53, 1, 'N', 4, 'quisque arcu libero rutrum ac lobortis vel dapibus at diam');
insert into tb_atendimento (dt_hr_atendimento, dsc_atendimento, id_tipo_atendimento, id_cliente, res_atendimento, id_produto, solucao_atendimento) values ('2018-10-19 21:05:36', 'consectetuer adipiscing elit proin', 2.57, 4, 'N', 6, 'amet sem fusce consequat nulla nisl nunc nisl duis bibendum');
insert into tb_atendimento (dt_hr_atendimento, dsc_atendimento, id_tipo_atendimento, id_cliente, res_atendimento, id_produto, solucao_atendimento) values ('2018-06-08 22:49:10', 'vel enim', 1.56, 3, 'N', 8, 'fusce lacus purus aliquet at feugiat non pretium quis lectus');
insert into tb_atendimento (dt_hr_atendimento, dsc_atendimento, id_tipo_atendimento, id_cliente, res_atendimento, id_produto, solucao_atendimento) values ('2018-03-22 23:44:49', 'imperdiet sapien urna pretium nisl', 2.89, 4, 'N', 1, 'a pede posuere nonummy integer non velit donec diam neque');
insert into tb_atendimento (dt_hr_atendimento, dsc_atendimento, id_tipo_atendimento, id_cliente, res_atendimento, id_produto, solucao_atendimento) values ('2018-06-25 05:37:59', 'ante vivamus tortor', 1.95, 8, 'N', 7, 'volutpat eleifend donec ut dolor morbi vel lectus in quam');
insert into tb_atendimento (dt_hr_atendimento, dsc_atendimento, id_tipo_atendimento, id_cliente, res_atendimento, id_produto, solucao_atendimento) values ('2018-09-04 07:54:13', 'ullamcorper augue a suscipit', 1.0, 9, 'N', 9, 'at turpis donec posuere metus vitae ipsum aliquam non mauris');
insert into tb_atendimento (dt_hr_atendimento, dsc_atendimento, id_tipo_atendimento, id_cliente, res_atendimento, id_produto, solucao_atendimento) values ('2018-05-14 15:45:04', 'auctor sed tristique in', 1.92, 6, 'N', 2, 'orci nullam molestie nibh in lectus pellentesque at nulla suspendisse');
insert into tb_atendimento (dt_hr_atendimento, dsc_atendimento, id_tipo_atendimento, id_cliente, res_atendimento, id_produto, solucao_atendimento) values ('2018-08-28 00:32:30', 'integer aliquet massa id lobortis', 1.95, 1, 'N', 3, 'odio odio elementum eu interdum eu tincidunt in leo maecenas');
insert into tb_atendimento (dt_hr_atendimento, dsc_atendimento, id_tipo_atendimento, id_cliente, res_atendimento, id_produto, solucao_atendimento) values ('2017-12-20 12:24:56', 'pharetra magna', 1.47, 10, 'N', 2, 'non lectus aliquam sit amet diam in magna bibendum imperdiet');
insert into tb_atendimento (dt_hr_atendimento, dsc_atendimento, id_tipo_atendimento, id_cliente, res_atendimento, id_produto, solucao_atendimento) values ('2018-01-11 15:36:33', 'et eros vestibulum ac', 2.89, 10, 'N', 5, 'hendrerit at vulputate vitae nisl aenean lectus pellentesque eget nunc');
insert into tb_atendimento (dt_hr_atendimento, dsc_atendimento, id_tipo_atendimento, id_cliente, res_atendimento, id_produto, solucao_atendimento) values ('2018-09-19 13:51:55', 'nunc viverra', 1.87, 3, 'N', 8, 'id consequat in consequat ut nulla sed accumsan felis ut');
insert into tb_atendimento (dt_hr_atendimento, dsc_atendimento, id_tipo_atendimento, id_cliente, res_atendimento, id_produto, solucao_atendimento) values ('2018-01-27 05:55:43', 'vel dapibus at diam nam', 2.89, 5, 'N', 10, 'a nibh in quis justo maecenas rhoncus aliquam lacus morbi');
insert into tb_atendimento (dt_hr_atendimento, dsc_atendimento, id_tipo_atendimento, id_cliente, res_atendimento, id_produto, solucao_atendimento) values ('2018-10-31 01:31:12', 'convallis morbi', 1.08, 10, 'N', 6, 'odio donec vitae nisi nam ultrices libero non mattis pulvinar');
insert into tb_atendimento (dt_hr_atendimento, dsc_atendimento, id_tipo_atendimento, id_cliente, res_atendimento, id_produto, solucao_atendimento) values ('2018-09-12 10:36:12', 'urna ut tellus', 1.14, 10, 'N', 10, 'posuere nonummy integer non velit donec diam neque vestibulum eget');
insert into tb_atendimento (dt_hr_atendimento, dsc_atendimento, id_tipo_atendimento, id_cliente, res_atendimento, id_produto, solucao_atendimento) values ('2018-03-02 17:51:12', 'sed augue', 1.7, 5, 'N', 10, 'egestas metus aenean fermentum donec ut mauris eget massa tempor');
insert into tb_atendimento (dt_hr_atendimento, dsc_atendimento, id_tipo_atendimento, id_cliente, res_atendimento, id_produto, solucao_atendimento) values ('2018-01-11 10:49:58', 'ut dolor morbi vel', 1.14, 9, 'N', 2, 'nisl duis bibendum felis sed interdum venenatis turpis enim blandit');
insert into tb_atendimento (dt_hr_atendimento, dsc_atendimento, id_tipo_atendimento, id_cliente, res_atendimento, id_produto, solucao_atendimento) values ('2017-12-15 00:50:49', 'felis ut at', 2.69, 10, 'N', 7, 'viverra eget congue eget semper rutrum nulla nunc purus phasellus');
insert into tb_atendimento (dt_hr_atendimento, dsc_atendimento, id_tipo_atendimento, id_cliente, res_atendimento, id_produto, solucao_atendimento) values ('2018-02-14 05:01:47', 'ut blandit', 2.14, 10, 'N', 1, 'lectus in quam fringilla rhoncus mauris enim leo rhoncus sed');
insert into tb_atendimento (dt_hr_atendimento, dsc_atendimento, id_tipo_atendimento, id_cliente, res_atendimento, id_produto, solucao_atendimento) values ('2018-08-28 10:56:17', 'sit amet justo morbi ut', 2.15, 10, 'N', 4, 'porta volutpat quam pede lobortis ligula sit amet eleifend pede');
insert into tb_atendimento (dt_hr_atendimento, dsc_atendimento, id_tipo_atendimento, id_cliente, res_atendimento, id_produto, solucao_atendimento) values ('2018-08-02 14:38:57', 'in faucibus', 2.98, 6, 'N', 3, 'ut nunc vestibulum ante ipsum primis in faucibus orci luctus');
insert into tb_atendimento (dt_hr_atendimento, dsc_atendimento, id_tipo_atendimento, id_cliente, res_atendimento, id_produto, solucao_atendimento) values ('2018-02-19 04:18:55', 'bibendum imperdiet nullam', 2.6, 1, 'N', 7, 'venenatis tristique fusce congue diam id ornare imperdiet sapien urna');
insert into tb_atendimento (dt_hr_atendimento, dsc_atendimento, id_tipo_atendimento, id_cliente, res_atendimento, id_produto, solucao_atendimento) values ('2018-09-23 19:19:25', 'convallis nulla neque', 1.25, 5, 'N', 9, 'non interdum in ante vestibulum ante ipsum primis in faucibus');
insert into tb_atendimento (dt_hr_atendimento, dsc_atendimento, id_tipo_atendimento, id_cliente, res_atendimento, id_produto, solucao_atendimento) values ('2018-07-06 03:33:38', 'quam a odio in', 2.26, 10, 'N', 7, 'sollicitudin vitae consectetuer eget rutrum at lorem integer tincidunt ante');
insert into tb_atendimento (dt_hr_atendimento, dsc_atendimento, id_tipo_atendimento, id_cliente, res_atendimento, id_produto, solucao_atendimento) values ('2018-03-01 08:35:01', 'proin at', 2.35, 2, 'N', 3, 'vitae consectetuer eget rutrum at lorem integer tincidunt ante vel');
insert into tb_atendimento (dt_hr_atendimento, dsc_atendimento, id_tipo_atendimento, id_cliente, res_atendimento, id_produto, solucao_atendimento) values ('2018-07-08 03:43:07', 'justo eu', 2.55, 8, 'N', 8, 'lobortis convallis tortor risus dapibus augue vel accumsan tellus nisi');
insert into tb_atendimento (dt_hr_atendimento, dsc_atendimento, id_tipo_atendimento, id_cliente, res_atendimento, id_produto, solucao_atendimento) values ('2018-02-04 12:28:42', 'in congue etiam', 1.16, 8, 'N', 6, 'duis consequat dui nec nisi volutpat eleifend donec ut dolor');
insert into tb_atendimento (dt_hr_atendimento, dsc_atendimento, id_tipo_atendimento, id_cliente, res_atendimento, id_produto, solucao_atendimento) values ('2018-08-02 10:04:24', 'et tempus', 2.0, 8, 'N', 7, 'in lectus pellentesque at nulla suspendisse potenti cras in purus');
insert into tb_atendimento (dt_hr_atendimento, dsc_atendimento, id_tipo_atendimento, id_cliente, res_atendimento, id_produto, solucao_atendimento) values ('2018-09-20 04:50:31', 'nunc commodo', 2.73, 9, 'N', 8, 'accumsan tortor quis turpis sed ante vivamus tortor duis mattis');
insert into tb_atendimento (dt_hr_atendimento, dsc_atendimento, id_tipo_atendimento, id_cliente, res_atendimento, id_produto, solucao_atendimento) values ('2018-04-07 09:08:57', 'non interdum in', 1.93, 7, 'N', 10, 'id lobortis convallis tortor risus dapibus augue vel accumsan tellus');
insert into tb_atendimento (dt_hr_atendimento, dsc_atendimento, id_tipo_atendimento, id_cliente, res_atendimento, id_produto, solucao_atendimento) values ('2017-12-28 09:07:33', 'parturient montes nascetur ridiculus mus', 1.34, 8, 'N', 3, 'nulla quisque arcu libero rutrum ac lobortis vel dapibus at');