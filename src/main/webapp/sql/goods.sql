CREATE TABLE IF NOT EXISTS Goods (
	g_id VARCHAR(10) NOT NULL,
	g_name VARCHAR(20),
	g_unitPrice INTEGER,
	g_maker VARCHAR(20),
	g_description TEXT,
	g_category VARCHAR(20),
	g_unitsInStock LONG,
	g_condition VARCHAR(20),
	g_fileName VARCHAR(20),
	PRIMARY KEY (g_id)
) DEFAULT CHARSET = utf8;
