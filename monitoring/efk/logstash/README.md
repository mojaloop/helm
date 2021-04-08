# Logstash Rollover Policy

To configure a Rollover Policy for the Logstash index execute the following steps:

1. [Create a Policy](#1111-create) with the desired Rollover configurations: [policy-rollover-logstash.json](policy-rollover-logstash.json)
2. [Create a Template](#1121-create) to associate the Policy Settings to the Logstash index

## 1. Pre-requisites

### 1.1 Elasticsearch

#### 1.1.1 Logstash Index Rollover Policy

Configure the `logstash_rollover_policy` based on the following config: [policy-rollover-logstash.json](policy-rollover-logstash.json).

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

Ensure that you have created the `logstash_template` based on the following config: [template-logstash.json](template-logstash.json).

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
