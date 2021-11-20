-- Create Table view.
CREATE VIEW v_HabitatLocationObsv AS
-- Get attributes from tables
Select
-- Ensure that each record has a unique ID.
	Distinct D.recid,
	E.eventid,
	L.utmx,
	L.utmy,
	S.commonname,
	D.number,
	E.year
-- Name tables where data is stored.
From
-- Join #1: data table to events table, keeping all entries.
	tbl_data D inner join tbl_events E
	ON D.eventid = E.eventid
-- Join #2: Data table to Locations table, keeping all enties.
	Inner Join tbl_locations L
	ON D.locationid = L.locationid
-- Join #3 keeps entries in data tables and removes any unused species data during join.
	Left Join tbl_species S
	ON D.speciesid = S.speciesid
-- Ensure that an observation was made at the location indicated.
Where
	D.number > 0
-- Structure the table with an easy to follow index.
Order by D.recid