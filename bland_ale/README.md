# Landable Overview

- Landable is an open-source Rails Engine created by Enova
  - It is an API to intended to support Content Managment Systems 
  - It uses ActiveRecord to write visit data to the app's PostgreSQL database
- The [Landable](https://github.com/enova/landable) repo was archived on 2022-05-12 
- Landable was designed for Rails 4.2+
  - Last commit was three years ago to enable Rails 5.x 
  - OMF has a customized fork of Landable to enable use in Rails 6.x
  - Rails 7 is the current release 

## Example

https://github.com/mike-omf/geekfest-omf/tree/main/bland_ale

## Other Presentations

## [2023-05-16: What is Landable?](https://onemain.atlassian.net/wiki/spaces/~728913980/pages/19359072502/Geekfest+OMF+Sessions+Schedule#2023-05-16%3A-What-is-Landable%3F)

```
Landable is an analytics tool embedded in our Frontend and Acquisition systems.
Let’s take a look at how to use Landable data to understand our customer
experience and diagnose issues.
```

Recording [Geekfest_ Shared Learning & Discussion on a variety of technical topics-20230516_121805-Meeting Recording.mp4](https://slfs-my.sharepoint.com/personal/mike_hall_omf_com/_layouts/15/guestaccess.aspx?guestaccesstoken=E1POcvJ3PzGbicXAMmXNVAf6ZFpwod9f5RbMqnjA7fY%3D&docid=2_0d77f8f0cdbba4498a9b09876552bd6e9&rev=1&e=IdOOJJ)


# FAQ

Thanks, JT Tabencki.

- Landable vs Heap? What is the difference?

    They essentially serve the same primary objective: provide a mechanism for
    tracking visitor sessions to your website. 

    Landable was adopted very early in the Digital development cycle. I don't
    have full insight into the decisions but at the time Landable was a viable
    choice for quickly adding instrumentation into the Rails app. The issues
    we're seeing are due to the age of the tool and the cruft that has built up
    over the past several years. Likely reason for choosing Landable over a
    third-party would be cost and the need to keep data in-house (which is
    known to have been a concern for OMF prior to recently embracing cloud
    services)

- Why is Landable important?

    Landable data is used for analytics that inform business decisions.

    Landable is also a primary mechanism for diagnosing production issues by
    Digital.

    Hindsight is a tool built on top of the Frontend and Acquisition to help
    testers communicate issues when performing tests in our integration
    environments.

- Why is it so hard to "fix"?

    Landable is deeply integrated into 7 Rails applications and the schema is
    replicated Snowflake.

    When referring to Landable we're primarily talking about Frontend and
    Acquisition. 

    The Landable tool itself has been modified in the Acquisition database in
    order to correlate visits to Frontend with requests made to Acquisition. 

    There are also additional tables with hard references to Landable for
    tracking API calls (e.g. `service_calls`).

    `partial_applications` has a reference to Landable schema.

    ETL processes have accreted around the existing Landable schema.

    Snowflake has essentially a direct copy of the Landable schema so any
    queries to Snowflake would be affected.

    We only a general understanding of how deeply integrated Landable schema
    reaches into dashboards, business decision tools.

- Why doesn't Landable work on Angular?

    There has been a recent update on this question. 

    Benjamin Van Heest has worked out how to integrate the Landable tracking with Angular. 

    Chris Mendoza, manager Content Team can provide more context.

    - Historical Context

        Landable is directly embedded into the Rails applications, and was only
        built for that use-case.

        The issue we're having with Angular is due to our reliance on processes
        built upon the Landable schema.

        It is technically possible to recreate a version of the Landable schema
        and use that from Angular.

        There is no prohibition from writing directly to the Landable database.

- Do we have a backup if Landable is down?

    No and yes. 

    Landable is integrated directly into FE/ACQ. If Landable is down the entire
    site is down and vice-versa.

    There can be issues where there are failures to write to Landable, as seen
    in the recent updates to events and page_views.

    There are processes that export and build queries from Landable schema into
    Snowflake. Analytics queries are written against Snowflake to my knowledge. 
