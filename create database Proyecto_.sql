create database Proyecto_BD;

use Proyecto_BD;

create table Suscripcion (
suscri_id int,
Email varchar (50),
Pass varchar (100),
constraint pk_su primary key (suscri_id)
);

select * from Suscripcion;

create table Perfil1 (
per_1 int auto_increment,
nombre varchar (20),
apellido varchar (20),
apodo varchar (20),
fechaNac date,
instrumento varchar (100),
localidad varchar (100),
nombreMisLetras varchar (50),
misMP3 varchar (50),
misVideos varchar (50),
misRiff varchar (50),
misMelodias varchar (50),
misPortadas varchar (50),
misHobbys varchar (200),
manager varchar (20),
usuario1 int, 
constraint pk_sp primary key (per_1),
constraint fk_fus foreign key (usuario1) references Suscripcion (suscri_id)  
);

create table Perfil2 (
per_2 int auto_increment,
integrantes varchar (200),
nombreBanda varchar (50),
nombre varchar (20),
apellido varchar (20),
apodo varchar (20),
letras varchar (50),
per_1_1 int,
constraint pk_per primary key (per_2),
constraint fk_fp1_1 foreign key (per_1_1) references Perfil1 (per_1)
);

create table MisVideos (
vid_1 int auto_increment,
solista varchar (100),
ConLaVanda varchar (100),
instrumental varchar (100),
mis_Solos varchar (100),
mis_Riff varchar (100),
mis_Arpegios varchar (100),
Mis_Melodias varchar (100),
vid_1_1 int,
constraint pk_v1 primary key (vid_1),
constraint fk_fv1_1 foreign key (vid_1_1) references Perfil2 (per_2)
);

create table mp3 (
mp_3 int auto_increment,
misSolos varchar (100),
misRiff varchar (100),
misArpegios varchar (100),
misMelodias varchar (100),
per_2_3 int,
per_1_3 int,
constraint pk_m primary key (mp_3),
constraint fk_p_2_3 foreign key (per_2_3) references Perfil2 (per_2),
constraint fk_p_1_3 foreign key (per_1_3) references Perfil1 (per_1)
);

select * from mp3;

-- Relacion Perfil1-Perfil2

create table Per1_Per2 (
per_1_2 int,
per_2_1 int,
constraint fk_p_1_2 foreign key (per_1_2) references Perfil1 (per_1),
constraint fk_p_2_1 foreign key (per_2_1) references Perfil2 (per_2)
);

-- Relacion Perfil2-MisVideos

create table per2_Videos (
per_2_2 int,
vid_1_1 int,
constraint fk_p_2_2 foreign key (per_2_2) references Perfil2 (per_2),
constraint fk_v_1_1 foreign key (vid_1_1) references MisVideos (vid_1)
);

-- Relacion MisVideos-Perfil1

create table Videos_Perfil1 (
vid_1_2 int,
per_1_4 int,
constraint fk_v_1_2 foreign key (vid_1_2) references MisVideos (vid_1),
constraint fk_p_1_4 foreign key (per_1_4) references Perfil1 (per_1)
);

-- relacion MisMp3-Perfil1

create table MisMp3_Perfil1 (
mp_3_2 int,
Per_1_5 int,
constraint fk_m_3_2 foreign key (mp_3_2) references mp3 (mp_3),
constraint fk_p_1_5 foreign key (per_1_5) references Perfil1 (per_1)
);

-- relacion MisMp3-Perfil2

create table Mp3_Perfil2 (
mp_3_1 int,
per_2_4 int,
constraint fk_m_3_1 foreign key (mp_3_1) references mp3 (mp_3),
constraint fk_p_2_4 foreign key (per_2_4) references Perfil2 (per_2)
)