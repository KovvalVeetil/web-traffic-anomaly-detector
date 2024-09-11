# Web Traffic Anomaly Detector - WIP

The Web Traffic Anomaly Detector is a Ruby on Rails application designed to monitor web traffic logs and detect anomalies such as high traffic from a single IP address or unusual request patterns. The project aims to help identify potential issues like bot attacks, unauthorized access, or other irregular activities in web server traffic.

## Features

- **Log Monitoring:** Collect and store web server logs (e.g., Apache, Nginx) in a PostgreSQL database.
- **Anomaly Detection:** Identify anomalies such as sudden traffic spikes, repetitive requests, or suspicious IP addresses using simple rules-based logic.
- **Alerts and Reports:** Notify users when anomalies are detected and provide basic reports on detected anomalies.
- **Background Processing:** Utilize background jobs with Sidekiq or Rails' built-in Active Job for asynchronous log processing.
- **User Interface:** A simple web UI to display logs, detected anomalies, and basic traffic visualizations using Chartkick or D3.js.

## Technologies Used

- **Backend:** Ruby on Rails
- **Database:** PostgreSQL
- **Background Jobs:** Sidekiq or Rails Active Job
- **Log Parsing:** Logstash or custom Ruby scripts
- **Data Visualization:** Chartkick or D3.js
- **Web Server:** Apache or Nginx (for generating logs)

## Getting Started

### Prerequisites

- Ruby (version 3.0 or above)
- Rails (version 7.0 or above)
- PostgreSQL (version 13 or above)
- Redis (if using Sidekiq for background jobs)
- Apache or Nginx (for log generation)

### Installation

1. **Clone the Repository:**

    ```bash
    git clone https://github.com/your-username/web-traffic-anomaly-detector.git
    cd web-traffic-anomaly-detector
    ```

2. **Install Dependencies:**

    ```bash
    bundle install
    ```

3. **Set Up Database:**

    Create and migrate the database:

    ```bash
    rails db:create
    rails db:migrate
    ```

4. **Configure Web Server:**

    Set up Apache or Nginx on your local machine to generate logs. Ensure logs are accessible by your Rails application for ingestion.

5. **Start the Rails Server:**

    ```bash
    rails server
    ```

### Running Background Jobs

If using Sidekiq, start Sidekiq with:

```bash
bundle exec sidekiq
```
