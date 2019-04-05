CREATE TABLE tipos(
    id int(10) AUTO_INCREMENT NOT NULL,
    nombre varchar(20) NOT NULL,
    CONSTRAINT pk_tipos PRIMARY KEY(id)
)ENGINE=InnoDB;

INSERT INTO tipos VALUES(null,'Acero');
INSERT INTO tipos VALUES(null,'Agua');
INSERT INTO tipos VALUES(null,'Bicho');
INSERT INTO tipos VALUES(null,'Dragon');
INSERT INTO tipos VALUES(null,'Electrico');
INSERT INTO tipos VALUES(null,'Fantasma');
INSERT INTO tipos VALUES(null,'Fuego');
INSERT INTO tipos VALUES(null,'Hada');
INSERT INTO tipos VALUES(null,'Hielo');
INSERT INTO tipos VALUES(null,'Lucha');
INSERT INTO tipos VALUES(null,'Normal');
INSERT INTO tipos VALUES(null,'Planta');
INSERT INTO tipos VALUES(null,'Psiquico');
INSERT INTO tipos VALUES(null,'Roca');
INSERT INTO tipos VALUES(null,'Siniestro');
INSERT INTO tipos VALUES(null,'Tierra');
INSERT INTO tipos VALUES(null,'Veneno');
INSERT INTO tipos VALUES(null,'Volador');

CREATE TABLE clases(
    id int(10) AUTO_INCREMENT NOT NULL,
    nombre varchar(50) NOT NULL,
    CONSTRAINT pk_clases PRIMARY KEY(id)
)ENGINE=InnoDB;

INSERT INTO clases VALUES(null,'Fisico');
INSERT INTO clases VALUES(null,'Especial');
INSERT INTO clases VALUES(null,'Estado');

CREATE TABLE movimientos(
    id int(10) AUTO_INCREMENT NOT NULL,
    id_tipo int(10) NOT NULL,
    id_clase int(10) NOT NULL,
    nombre varchar(50) NOT NULL,
    descripcion text NOT NULL,
    potencia int(10),
    presicion int(10),
    CONSTRAINT pk_movimientos PRIMARY KEY(id),
    CONSTRAINT fk_movimiento_tipo FOREIGN KEY(id_tipo) REFERENCES tipos(id),
    CONSTRAINT fk_movimiento_clase FOREIGN KEY(id_clase) REFERENCES clases(id)
)ENGINE=InnoDB;

INSERT INTO movimientos VALUES(null,10,1,'Combate Cercano','Combate Cercano causa daño y no tiene ningún efecto secundario, pero baja un nivel la defensa y la defensa especial del usuario.',120,100);
INSERT INTO movimientos VALUES(null,3,3,'A Defender','A defender aumenta en un nivel la defensa y defensa especial del usuario.',null,null);
INSERT INTO movimientos VALUES(null,12,3,'Abatidoras','Abatidoras cambia temporalmente la habilidad del objetivo por insomnio, la cual hace que no se pueda dormir o se despierte si ya lo estaba haciendo. Abatidoras no puede cambiar las habilidades agrupamiento, ausente, banco, disfraz, escudo limitado, fuerte afecto, letargo perenne, multitipo, cambio táctico ni sistema alfa.',null,null);
INSERT INTO movimientos VALUES(null,12,3,'Absorbefuerza','Absorbefuerza reduce en un nivel el ataque del objetivo y a continuación restaura una cantidad de PS al usuario equivalente a la estadística de ataque del objetivo antes de ser reducido. El movimiento tiene en cuenta cambios en el nivel de ataque para calcular dicha cantidad, tanto positivos como negativos. En caso de que el usuario tenga los PS al máximo, absorbefuerza simplemente baja el ataque un nivel.',null,null);
INSERT INTO movimientos VALUES(null,12,2,'Absorber','Absorber causa daño y el usuario recupera el 50% de los PS quitados por el movimiento al objetivo. Sin embargo, si absorber es usado contra un Pokémon con la habilidad lodo líquido, el usuario perderá la mitad de los PS restados al rival en vez de recuperarlos. Absorber tiene 20 PP.',20,100);
INSERT INTO movimientos VALUES(null,17,2,'Acido','Ácido causa daño y tiene una probabilidad del 10% de bajar un nivel la defensa del objetivo. En combates dobles golpea a ambos oponentes. Ácido tiene ahora una probabilidad del 10% de bajar un nivel la defensa especial del objetivo. En combates triples golpea a todos los oponentes adyacentes al usuario.');

select m.nombre,t.nombre as tipo,c.nombre as categoria,m.potencia,m.presicion from movimientos m,tipos t,clases c where m.id_tipo=t.id and m.id_clase=c.id;

CREATE TABLE habilidades(
    id int(10) AUTO_INCREMENT NOT NULL,
    nombre varchar(200) NOT NULL,
    descripcion text NOT NULL,
    CONSTRAINT pk_habilidades PRIMARY KEY(id)
)ENGINE=InnoDB; 

INSERT INTO habilidades VALUES(null,'Absorve Agua','Recupera PS al recibir ataques de tipo agua.');
INSERT INTO habilidades VALUES(null,'Absorve Electricidad','Recupera PS al recibir ataques de tipo electrico.');
INSERT INTO habilidades VALUES(null,'Absorve Fuego','RPotencia movimientos de tipo fuego si ha sufrido antes alguno.');
INSERT INTO habilidades VALUES(null,'Aclimatacion','Anula los efectos del tiempo atmosférico.');
INSERT INTO habilidades VALUES(null,'Agallas','Sube el ataque si sufre un problema de estado.');
INSERT INTO habilidades VALUES(null,'Armadura Batalla','Bloquea los golpes críticos.');
INSERT INTO habilidades VALUES(null,'Ausente','El Pokémon no atacará en turnos consecutivos.');

CREATE TABLE grupos(
    id int(10) AUTO_INCREMENT NOT NULL,
    nombre varchar(50) NOT NULL,
    CONSTRAINT pk_grupos PRIMARY KEY(id)
)ENGINE=InnoDB;

INSERT INTO grupos VALUES(null,'Planta');
INSERT INTO grupos VALUES(null,'Bicho');
INSERT INTO grupos VALUES(null,'Volador');
INSERT INTO grupos VALUES(null,'Humanoide');
INSERT INTO grupos VALUES(null,'Mineral');
INSERT INTO grupos VALUES(null,'Amorfo');
INSERT INTO grupos VALUES(null,'Campo');
INSERT INTO grupos VALUES(null,'Agua 1');
INSERT INTO grupos VALUES(null,'Agua 2');
INSERT INTO grupos VALUES(null,'Agua 3');
INSERT INTO grupos VALUES(null,'Monstruo');
INSERT INTO grupos VALUES(null,'Hada');
INSERT INTO grupos VALUES(null,'Dragon');

CREATE TABLE pokemon(
    id int(10) AUTO_INCREMENT NOT NULL,
    id_habilidad int(10) NOT NULL,
    id_habilidad2 int(10),
    id_habilidad3 int(10),
    id_tipo int(10) NOT NULL,
    id_tipo2 int(10),
    id_grupo int(10),
    id_grupo2 int(10),
    numero int(10) NOT NULL,
    nombre varchar(50) NOT NULL,
    descripcion MEDIUMTEXT NOT NULL,
    imagen BLOB NOT NULL,
    peso float(10,2) NOT NULL,
    altura float(10,2) NOT NULL,
    hp int(10) NOT NULL,
    ata int(10) NOT NULL,
    def int(10) NOT NULL,
    ataesp int(10) NOT NULL,
    defesp int(10) NOT NULL,
    vel int(10) NOT NULL,
    CONSTRAINT pk_pokemon PRIMARY KEY(id),
    CONSTRAINT fk_pokemon_habilidad FOREIGN KEY(id_habilidad) REFERENCES habilidades(id),
    CONSTRAINT fk_pokemon_habilidad2 FOREIGN KEY(id_habilidad2) REFERENCES habilidades(id),
    CONSTRAINT fk_pokemon_habilidad3 FOREIGN KEY(id_habilidad3) REFERENCES habilidades(id),
    CONSTRAINT fk_pokemon_tipo FOREIGN KEY(id_tipo) REFERENCES tipos(id),
    CONSTRAINT fk_pokemon_tipo2 FOREIGN KEY(id_tipo2) REFERENCES tipos(id),
    CONSTRAINT fk_pokemon_grupo FOREIGN KEY(id_grupo) REFERENCES grupos(id),
    CONSTRAINT fk_pokemon_grupo2 FOREIGN KEY(id_grupo2) REFERENCES grupos(id)
)ENGINE=InnoDB;

INSERT INTO pokemon VALUES(null,1,2,3,12,17,11,1,001,'Bulbasaur','Cuando es joven, crece con los nutrientes que almacena en las semillas de su espalda.','./assets/001.png',6.9,0.7,45,49,49,65,65,45);
INSERT INTO pokemon VALUES(null,1,2,3,12,17,11,1,001,'Ivysaur',' 	Este Pokémon tiene un bulbo en el lomo. Dicen que, al absorber nutrientes, el bulbo se transforma en una flor grande. ','./assets/002.png',13.0,1.0,60,62,63,80,80,60);