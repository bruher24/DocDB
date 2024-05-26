#Общее представление о текущем состоянии пациента
SET @patient_id = 1;

CREATE TABLE IF NOT EXISTS `mydb`.`Card` (
  `name` VARCHAR(100) NOT NULL,
  `age` VARCHAR(100) NOT NULL,
  `phone` VARCHAR(100) NOT NULL,
  `anamnesis` VARCHAR(250) NULL,
  `diagnoses` VARCHAR(250) NULL,
  `medicines` VARCHAR(250) NULL,
  `therapies` VARCHAR(250) NULL);
  
SELECT Patients.patient_name AS name, TIMESTAMPDIFF(YEAR, Patients.dob, CURDATE()) AS age, Patients.patient_phone as phone, Patients.anamnesis INTO @name, @age, @phone,@anam FROM Patients WHERE Patients.patient_id = @patient_id;

SELECT GROUP_CONCAT(Diagnoses.diagnosis_name SEPARATOR ', ') INTO @diag FROM Diagnoses WHERE Diagnoses.diagnosis_id = ANY (SELECT patients_diagnoses.diagnosis_id FROM patients_diagnoses 
WHERE patient_id = @patient_id AND actuality = true);

SELECT GROUP_CONCAT(Medicines.medicine_name SEPARATOR ', ') INTO @med FROM Medicines WHERE Medicines.medicine_id = ANY (SELECT patients_medicines.medicine_id FROM patients_medicines 
WHERE patient_id = @patient_id AND TIMESTAMPDIFF(DAY, medicine_end , CURDATE()) <= 0);

SELECT GROUP_CONCAT(Therapies.therapy_name SEPARATOR ', ') INTO @ther FROM Therapies WHERE Therapies.therapy_id = ANY (SELECT patients_therapies.therapy_id FROM patients_therapies
 WHERE patient_id = @patient_id AND TIMESTAMPDIFF(DAY, therapy_end , CURDATE()) <= 0);
 
 INSERT INTO mydb.Card (name, age, phone, anamnesis, diagnoses, medicines, therapies) VALUES (@name, @age, @phone, @anam, @diag, @med, @ther);
 
 SELECT * FROM mydb.Card;
 DROP TABLE mydb.Card;