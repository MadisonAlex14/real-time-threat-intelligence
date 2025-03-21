-- - Database Schema for Threat Intelligence Data (PostgreSQL)

-- - Assets Table

CREATE TABLE assets (
    id SERIAL PRIMARY KEY,
    name VARCHAR(255) NOT NULL,
    category VARCHAR(50),
    description TEXT
);

-- - Threats Table
    
CREATE TABLE threats (
    id SERIAL PRIMARY KEY,
    asset_id INT REFERENCES assets(id) ON DELETE CASCADE,
    threat_name VARCHAR(255) NOT NULL,
    risk_level INT CHECK (risk_level BETWEEN 1 AND 10)
);

-- - Vulnerabilities Table

CREATE TABLE vulnerabilities (
    id SERIAL PRIMARY KEY,
    asset_id INT REFERENCES assets(id) ON DELETE CASCADE,
    vulnerability_name VARCHAR(255) NOT NULL,
    severity_level INT CHECK (severity_level BETWEEN 1 AND 10)
);

-- - Risk Rating Table

CREATE TABLE risk_ratings (
    id SERIAL PRIMARY KEY,
    asset_id INT REFERENCES assets(id) ON DELETE CASCADE,
    threat_id INT REFERENCES threats(id) ON DELETE CASCADE,
    vulnerability_id INT REFERENCES vulnerabilities(id) ON DELETE CASCADE,
    risk_score INT CHECK (risk_score BETWEEN 1 AND 100),
    risk_description TEXT
);

