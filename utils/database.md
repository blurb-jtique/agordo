# Database trick
## Import SQL
To import a .sql file into PostgreSQL 11 on Ubuntu 20.04, follow these steps:

### Step 1: Ensure PostgreSQL is Running

First, check if PostgreSQL is running:

sudo systemctl status postgresql

If it’s not running, start it with:

sudo systemctl start postgresql

### Step 2: Move the .sql File to an Accessible Location

Ensure your .sql file is in a location accessible by PostgreSQL, such as:

/home/your_user/backup.sql

If needed, move it using:

mv your_dump.sql /home/your_user/

### Step 3: Connect to PostgreSQL

Switch to the PostgreSQL user:

sudo -i -u postgres

Then, connect to PostgreSQL:

psql

### Step 4: Create a New Database (If Needed)

If you need to create a database before restoring, run:

CREATE DATABASE my_database;

Exit psql by typing:

\q

### Step 5: Import the .sql File

Use the following command to import the SQL dump into your PostgreSQL database:

psql -U postgres -d my_database -f /home/your_user/backup.sql

	•	-U postgres → Uses the postgres user.
	•	-d my_database → The target database.
	•	-f backup.sql → The SQL file to import.

If the import fails due to ownership issues, you can ignore them by using:

psql -U postgres -d my_database -f /home/your_user/backup.sql --set ON_ERROR_STOP=off

### Step 6: Verify the Import

After the import is complete, check if the tables and data are correctly loaded:

psql -U postgres -d my_database

Then, list tables:

\dt

Or check for indexes:

\di

### Step 7: Restart PostgreSQL (If Needed)

If you encounter issues, restart PostgreSQL:

sudo systemctl restart postgresql

🚀 Done!

Your .sql file has been successfully imported into PostgreSQL 11 on Ubuntu 20.04! 🎉

## examples
```
psql -h 192.168.64.1 -p 35432 -d postgres -U postgres
psql -h 192.168.64.1 -p 25432 -U postgres -d blurb_test -f 202502121550-blurb_dev.sql
```