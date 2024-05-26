#Заполнение БД тестовыми данными
INSERT INTO `mydb`.`Diagnoses` (`diagnosis_name`, `diagnosis_desc`) 
VALUES ('Амнезия', 'Потеря памяти'),
		('Бессоница','Проблемы со сном'),
        ('Паранойя','Излишняя подозрительность'),
        ('Паническое расстройство','Спонтанные панические атаки'),
        ('Депрессия','Упадок настроения, апатичное и подавленное состояние.'),
        ('Шизофрения','Фундаментальные нарушения воспрития.');

INSERT INTO `mydb`.`Medicines` (`medicine_name`, `medicine_desc`, `medicine_dose`, `receipt`)
VALUES ('Атаракс', 'Оказывает положительное влияние на когнитивные способности.', 'Средняя доза 50 мг/сут. Максимальная суточная доза 300 мг.', true),
		('Элицея', 'Антидепрессант. Селективный ингибитор обратного захвата.', '10-20 мг/сут. Максимальная суточная доза 20 мг. При прекращении лечения уменьшать дозировку в течение 1-2 недель.', true),
        ('Мелаксен', 'Оригинальный препарат мелатонина из США.', 'Курсом 6-8 недель. По 1 таб/д перед сном.', false),
        ('Ноотропил', 'Стимулирует когнитивные функции мозга.', '3 г/сут в 2-3 приема до полного выздоровления. Максимальная суточная доза 24 г.', false),
        ('drug1', 'desc1', 'dose1', false),
        ('drug2', 'desc2', 'dose2', true),
        ('drug3', 'desc3', 'dose3', false),
        ('drug4', 'desc4', 'dose4', true),
        ('drug5', 'desc5', 'dose5', false),
        ('drug6', 'desc6', 'dose6', true),
        ('drug7', 'desc7', 'dose7', false),
        ('drug8', 'desc8', 'dose8', false),
        ('drug9', 'desc9', 'dose9', false),
        ('drug10', 'desc10', 'dose10', true);

INSERT INTO `mydb`.`Patients` (`patient_name`, `dob`, `patient_phone`, `patient_email`, `anamnesis`) 
VALUES ('Иванов Иван Иваныч', '1998-01-01', '89991111111', null, 'Долго не может уснуть по ночам. Проблема наблюдается с 03.05.2024.'),
		('Петров Петр Петрович', '1995-05-13', '89992222222', null, 'С 20.05.2024 беспокоят панические атаки. Предвещающих факторов пациент не заметил.'),
        ('Васечкин Василий Васильевич', '2001-11-08', '89993333333', 'vasyan@mail.ru', 'Подавленное состояние, грусть, инфантилизм. Мысли об отсутствии смысла в жизни. Проблема наблюдается с 07.05.2024.'),
        ('Анатольев Анатолий Анатольевич', '1993-07-23', '89994444444', null, 'Слуховые галюцинации. Сильнодействующих препаратов не прнимает. Проблема наблюдается с 28.04.2024 с ухудшением состояния на протяжении всего времени.');

INSERT INTO `mydb`.`Schedule` (`datetime`, `patient_id`) 
VALUES ('2024-05-28 10:00', 1),
        ('2024-05-28 9:00', 2),
        ('2024-05-29 9:00', 3),
        ('2024-05-30 13:30', 4),
        ('2024-06-04 11:30', 2);

INSERT INTO `mydb`.`Therapies` (`therapy_name`, `therapy_desc`) 
VALUES ('Психотерапия', 'Межличностное вмешательство, в котором используется любая из ряда специфических психологических техник.'),
		('Арт-терапия', 'Лечение посредством разговорной терапии и творчества.'),
        ('Когнитивно-поведенческая терапия', 'Основывается на теории, что поведение человека является своеобразной реакцией с учетом прошлого опыта.'),
        ('Танцевально-двигательная терапия', 'Терапия, основанная на взаимосвязи тела и разума.'),
        ('therapy1', 'desc1'),
        ('therapy2', 'desc2'),
        ('therapy3', 'desc3'),
        ('therapy4', 'desc4');

INSERT INTO `mydb`.`diagnoses_medicines` (`diagnosis_id`, `medicine_id`) 
VALUES ('1', '4'), ('1','3'), ('1', '6'),
		('2', '1'), ('2', '10'), ('2', '7'),
        ('3', '14'), ('3', '11'),
        ('4', '5'), ('4', '2'),
        ('5', '8'), ('5', '12'), ('5', '3'),
        ('6', '10'), ('6', '3'), ('6', '13');

INSERT INTO `mydb`.`diagnoses_therapies` (`diagnosis_id`, `therapy_id`)
VALUES ('1', '3'),
		('2', '2'), ('2', '3'),
        ('3', '1'), ('3', '6'), ('3', '4'),
        ('4', '1'), ('4', '8'),
        ('5', '1'), ('5', '2'), ('5', '7'),
        ('6', '1'), ('6', '5');

INSERT INTO `mydb`.`patients_diagnoses` (`patient_id`, `diagnosis_id`, `diagnosis_date`, `actuality`)
VALUES ('4', '3', '2024-03-10', false), ('4', '6', '2024-05-26', true),
		('1', '1', '2024-05-10', true),
        ('2', '4', '2024-05-24', true),
        ('3', '5', '2024-05-17', true);

INSERT INTO `mydb`.`patients_medicines` (`patient_id`, `medicine_id`, `medicine_dose`, `medicine_start`, `medicine_end`, `medicine_result`)
VALUES ('4', '14', 'dose10', '2024-03-10', '2024-05-10', 'Полное избавление от симптомов. Лечение успешно.'), ('4', '5', 'dose1', '2024-05-28', '2024-06-28', null),
		('1', '3', 'dose5', '2024-05-10', '2024-06-10', null), ('1', '4', 'dose6', '2024-05-10', '2024-06-10', null),
        ('2', '5', 'dose6', '2024-05-24', '2024-06-07', null),
        ('3', '12', 'dose7', '2024-05-17', '2024-08-17', null);

INSERT INTO `mydb`.`patients_therapies` (`patient_id`, `therapy_id`, `therapy_start`, `therapy_end`, `therapy_result`)
VALUES ('4', '1', '2024-03-10', '2024-05-10', 'Полное избавление от симптомов. Лечение успешно.'), ('4', '6', '2024-05-28', '2024-11-28', null),
		('1', '3', '2024-05-10', '2024-08-10', null),
        ('2', '8', '2024-05-24', '2024-06-07', null),
        ('3', '2', '2024-05-17', '2024-08-17', null);
