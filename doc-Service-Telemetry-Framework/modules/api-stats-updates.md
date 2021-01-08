# Monitoring Container Health and API Statuses

Container health assesses the status of each of the {OpenStack} service containers
by periodically running a health check script using the docker standard. 
Most {OpenStack} services implement a healthcheck that logs issues and returns a
binary status (healthy or unhealthy). For the OpenStack APIs, the healthchecks 
query the root endpoint and determine the health based on the response time.

To monitor healthchecks in {ProjectShort}, the collectd-sensubility plugin must be enabled 
and configured to work with the amqp1 protocol. The {ProjectShort} architecture considers
healthcheck results to be events and are thus stored in ElasticSearch.

## Prerequisites

- You have created the `stf-connectors.yaml` file. For more information, see xref:configuring-red-hat-openstack-platform-overcloud-for-stf_completing-the-stf-configuration[].

- You are using the most current version of {OpenStack} {OpenStackVersion}.

## Configuring collectd-sensubility

Within the `stf-connectors.yaml`, configure collectd-sensubility to use the amqp1
transport protocol:
```yaml
...

CollectdSensubilityTransport: amqp1
```

In a multicloud environment, the collectd-sensubility events channel will need 
to be adjusted in accordance with the new collectd events address. For more information, see xref:configuring-multiple-clouds_advanced-features[]
section for more information on setting up multi-cloud addresses. Configure the 
new collectd events address by changing the `CollectdSensubilityResultsChannel` 
in the `stf-connectors.yaml`:

```yaml
...

CollectdSensubilityResultsChannel: collectd/cloudprefix-notify
```
