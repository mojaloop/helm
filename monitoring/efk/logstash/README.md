# Logstash Rollover Policy

To configure a Rollover Policy for the Logstash index execute the following steps:

1. Create a [Policy](#1111-create) with the desired Rollover configurations: [policy-rollover-logstash.json](./policy-rollover-logstash.json)
2. Create a [Template](#1121-create) to associate the Policy Settings to the Logstash index

## 1. Pre-requisites

### 1.1 Elasticsearch

Ensure that you have created the `mojatemplate` based on the following config: [template](./config/template-mojaloop.json).

#### 1.1.1 Logstash Index Rollover Policy

##### 1.1.1.1 Create
```curl
curl -X PUT "http://elasticsearch:9200/_ilm/policy/logstash_rollover_policy?pretty" -H 'Content-Type: application/json' -d @policy-rollover-logstash.json
```

##### 1.1.1.2 Delete
_Note: only needed if you need to remove the policy_
```curl
curl -X DELETE "http://elasticsearch:9200/_ilm/policy/logstash_rollover_policy?"
```

#### 1.1.1.3 Get
_Note: useful for debugging issues_
```curl
curl -X GET "http://elasticsearch:9200/_ilm/policy/logstash_rollover_policy?"
```

#### 1.1.2 Logstash Index Template

##### 1.1.2.1 Create
```curl
curl -X PUT "http://elasticsearch:9200/_template/logstash_template?pretty" -H 'Content-Type: application/json' -d @config/template-logstash.json'
```

##### 1.1.2.2 Delete
_Note: only needed if you need to remove the template_
```curl
curl -X DELETE "http://elasticsearch:9200/_template/logstash_template"
```

 ##### 1.1.2.3 Get
 _Note: useful for debugging issues_
```curl
curl -X GET "http://elasticsearch:9200/_template/logstash_template"
```
