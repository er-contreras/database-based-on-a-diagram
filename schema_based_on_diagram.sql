
CREATE TABLE patients (
	id SERIAL PRIMARY KEY,
	name varchar(22),
	date_of_birth DATE
);

CREATE TABLE medical_histories (
	id SERIAL PRIMARY KEY,
	admitted_at timestamp,
	patient_id int,
	status varchar(22)
);

CREATE TABLE invoices (
	id SERIAL PRIMARY KEY,
	total_amount decimal(18,4),
	generated_at timestamp,
	payed_at timestamp,
	medical_history_id int
);

CREATE TABLE treatments (
	id SERIAL PRIMARY KEY,
	type varchar(22),
	name varchar(22)
);

CREATE TABLE invoice_items (
	id SERIAL PRIMARY KEY,
	unit_price decimal(18,4),
	quantity int,
	total_price decimal(18,4),
	invoice_id int,
	treatment_id int
);

CREATE TABLE medical_histories_and_treatments (
	medical_histories_id int,
	treatments_id int,
	FOREIGN KEY (medical_histories_id) REFERENCES medical_histories(id),
	FOREIGN KEY (treatments_id) REFERENCES treatments(id),
	PRIMARY KEY (medical_histories_id, treatments_id)
)
