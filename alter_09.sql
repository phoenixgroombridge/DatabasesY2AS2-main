--PKs
ALTER TABLE accommodations
ADD CONSTRAINT pk_accomodations
PRIMARY KEY (accommodation_id);

ALTER TABLE retreat_accommodations
ADD CONSTRAINT pk_retreat_accommodations
PRIMARY KEY (retreat_id, accommodation_id);

ALTER TABLE retreats
ADD CONSTRAINT pk_retreats
PRIMARY KEY (retreat_id);

ALTER TABLE programmes
ADD CONSTRAINT pk_programmes
PRIMARY KEY (programme_id);

ALTER TABLE guides
ADD CONSTRAINT pk_guides
PRIMARY KEY (guide_id);


--FKs
ALTER TABLE retreat_accommodations
ADD CONSTRAINT fk_r_a_retreats
FOREIGN KEY (retreat_id)
REFERENCES retreats(retreat_id);

ALTER TABLE retreat_accommodations
ADD CONSTRAINT fk_r_a_accommodations
FOREIGN KEY (accommodation_id)
REFERENCES accommodations(accommodation_id);

ALTER TABLE programmes
ADD CONSTRAINT fk_p_retreat_accommodations
FOREIGN KEY (retreat_id, accommodation_id)
REFERENCES retreat_accommodations(retreat_id, accommodation_id);

ALTER TABLE programmes
ADD CONSTRAINT fk_p_guides
FOREIGN KEY (guide_id)
REFERENCES guides(guide_id);