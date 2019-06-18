# Meetup 2 | June 21, 2019
Welcome to round 2! In this meetup, we're going to give you the tools you'll need to build a clean and secure Snowflake instance.

We're going to focus on the most common activities needed to standup a fictitious `SALES` database to be used by the following personas:
- the snowflake administrator (you)
- the data engineer
- the data scientist
- the business analyst

After this meetup, you should have the skills to avoid the major headaches that are most common to new Snowflake administrators. You will also have a set of templates you can use to perform your most common tasks in a reliable and repeatable way.

## Prerequisites
Before you get started, make sure you have access to a snowflake account that you can be admin of. If this isn't your work instance (or you don't have a work instance), [it's simple to sign up for a new account with tons of free credits here](https://trial.snowflake.com/).

If this is your first meetup event, also be sure to [run this basic setup script in Snowflake](../../meetupEnvironmentSetup.sql). This will create some core objects that are used across multiple meetups.

## Snowflake Security Concepts
TODO - write these

## Setup
While there is rarely a "right" way to organize your Snowflake instance, there are certainly "wrong" ways to do so. For today, we're going to create an entirely new database aligned to our business activities. Future meetups will work to use the `OKC_MEETUP_DB`.

[Run this SQL script to create our top level objects and our security entities.](./sql/salesSetup.sql)

## Sales Administrator Tasks
Now that we've finished doing things that must be done with high privelege, lets drop down to the `SALES_ADMIN` role and continue building our environment with more restricted permissions.

[Run this SQL script to finish building our sales environment.](./sql/salesAdministration.sql)

## User Creation
Our Sales environment is now ready to use. Let's see how to create user accounts for user access as well as how we can setup service accounts for BI tools.

[Run this SQL script to create users in our instance.](./sql/userCreation.sql)

## Teardown
Now that we've had our fun, you can run this script to undo all our hard work. It's nice to see how this is done so you can practice keeping your Snowflake environment tidy.

[Run this SQL script to clean up.](./sql/salesTeardown.sql)