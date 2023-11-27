# Ritual-App-Data-Engineer-Home-Exercise


## Project Setup Guide
Welcome to the Project Setup Guide. Below you will find step-by-step instructions to get the project up and running.

Prerequisites
Before you begin, make sure you have Python installed on your system. This project is tested on Python 3.8 and above.

### 1. Installation
Install Dependencies:

Open a terminal and navigate to the project directory. Install the required Python packages using the following command:

```sh
pip install -r requirements.txt
```

### 2. Authentication Token for DuMotherDuck (Managed DuckDB)

To interact with MotherDuck, you'll need an authentication token. Obtain this token from the MotherDuck UI Settings:

- Log in to the MotherDuck UI.
- Navigate to the Settings area.
- Locate the API token section and generate a new token if necessary.
- Copy the token for use in the next steps.

### 3. Upload Raw Data to DuckDB:

Run the `starter.ipynb`  Jupyter notebook to upload your raw data to DuckDB:

- Set Token Environment Variable:
    ```sh
    export MOTHERDUCK_TOKEN=your-token-value
    ```
- Open the provided starter notebook from the project directory.
- Execute the notebook cells in order to upload data to DuckDB.

### 4. Build Models with dbt:

- Use dbt (data build tool) to transform your raw data into models
    ```sh
    cd ritualapp_dbt
    ```
- Ensure dbt is installed:
    ```sh
    dbt --version
    ```
- set up with the necessary profiles to connect to DuckDB.
    ```sh
    dbt --debug --profiles-dir ./
    ```
- Build the models using:
    ```sh
    dbt run
    ```
This command will compile your dbt models and execute them against your DuckDB database.

### 5. Connect MotherDuck to Preset:

To visualize your data, you can connect MotherDuck to Preset, a visualization platform:

- Log in to your Preset account.
- Go to the 'Sources' section and add a new database source.
- Select DuckDB as the database type.
- Use the authentication token from step 2 to configure the connection.
- Save and test the connection to ensure it's working correctly.

### 6. Building Dashboards:

With the data models built and the connection to Preset established, you can now start building your dashboards:

- Navigate to the Dashboards section in Preset.
- Create a new dashboard and start adding charts and visualizations.
- Select your DuckDB data source and use the models created by dbt to power your charts.
- Save and share your dashboard as needed.

### 7. Additional Notes
Keep your authentication tokens secure.
Always verify that you are in the correct directory when running commands in the terminal.
For detailed dbt usage, consult the dbt documentation.