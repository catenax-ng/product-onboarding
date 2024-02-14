# Overview

Catena-X@Home is a walkthrough of all essential Catena-X services. 
The target users for Catena-X are developers and architects who want to learn the concepts and try them out on their own.

# What You Will Learn

In this guide, you will learn as **Data Provider** how to:

 - Create sample submodel data
 - Create an Eclipse Data Space Connector Assets and Contract Definition 
 - Make your submodel data discoverable with Digital Twins and the Digital Twin Registry

and as **Data Consumer**:
 - Search for digital twins in the Digital Twin Registry
 - Request a data using Eclipse Data Space Connectors and digital twins as data consumer

## Prerequisites

Before starting this guide, you will need:

 - Tools Installed: [Docker](https://docs.docker.com/get-docker/), [Docker Compose](https://docs.docker.com/compose/install/), [git](https://git-scm.com/downloads) and [Postman](https://www.postman.com/)
 - GitHub Personal Access Token: [GitHub](https://github.com/settings/tokens) with `read:packages` permissions. You need the access token to download the docker images.
    
## Setup

In this section, we will start the Catena-X Core services as docker containers. 

1. Clone the repository [Catena-X](https://github.com/catenax-ng/catenax-at-home):
```bash
    git clone https://github.com/catenax-ng/catenax-at-home.git
```
2. Open a terminal and run:
```bash 
    cd getting-started-guide
```
4. To start all relevant docker containers run:
```bash 
    docker-compose up -d
```
5. Verify that the docker containers are running:

```bash 
docker ps
```
6. The setup is now complete! In the next sections, we will interact with the services.

## End-to-End Use Case

The interaction diagram below shows the complete interactions that we will go through.

![End-To-End interaction](assets/catenax-at-home/sequence-end-to-end.png)

:::note
In the upcoming sections, we will go through each of the relevant steps with explanations.

To **try out the End-to-End** use case you need to import the Postman collection located in the repository:

```bash 
    ./getting-started-guide/Catena-X@Home.postman_collection.json
```

The Postman collection contains all relevant requests from the above diagram.

All variables are located at the collection level. You can view them in the `Variables` tab. 
![Postman variables](assets/catenax-at-home/catenax_at_home_postman_variables.png)

### Register EDC assets and Digital Twins

In this section, we will focus on the steps that a **Data Provider** has to follow.

<details>
    <summary>
      Actor: Data Provider 
    </summary>
    <div>
      The data provider registers AAS Descriptors and Submodel Descriptors so that consumers 
      can query for AAS Descriptors and request data via the Submodel Descriptor Endpoints.   
    </div>
</details>

#### Step 1: Create Sample Material Data


<details>
    <summary>
      What is a Submodel Server
    </summary>
    <div>
      A Submodel Server is a service that serves data that you want to make available to data consumers.
      Almost all organizations do have their own structure for their data. Hence, Data Providers will likely implement their own
      Submodel Servers that mainly map their own structure into Catena-X defined Semantic Models. 
      <p><b>Being compliant with a Semantic Model is the only requirement for a Submodel Server. </b></p>
    </div>
</details>

For the purpose of the demonstration, we created a trivial Submodel Server that is compliant with the Semantic Model Traceability.

The first request creates Traceability data. Our final goal is to make this data available to data consumers.

#### Note Action
Please run the request `1. Create Sample Data` of the **Postman** collection to create a data entry.

You now created traceability data that we can use to share.

#### Step 2: Create an EDC Asset

The request payload to create an EDC Asset is:

```json
{
  "asset": {
    "properties": {
      // {{digitalTwinId}}-{{digitalTwinSubmodelId}}
      // highlight-next-line
      "asset:prop:id": "urn:uuid:365e6fbe-bb34-11ec-8422-0242ac120002-urn:uuid:61125dc3-5e6f-4f4b-838d-447432b97918",
      "asset:prop:name": "product description",
      "asset:prop:contenttype": "application/json",
      "asset:prop:policy-id": "use-eu"
    }
  },
  "dataAddress": {
    "properties": {
      // {{digitalTwinSubmodelId}}
      // highlight-next-line
      "endpoint": "http://provider-backend-service:8080/data/urn:uuid:61125dc3-5e6f-4f4b-838d-447432b97918",
      "type": "HttpData"
    }
  }
}
```

The most relevant part of the edc payload are the fields `assetDto#asset:prop:id` and `dataAddressDto:endpoint`.

| Field                             | Description                                                                                                                                                                                                                                                                                                                                                                                |
|-----------------------------------|--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------|
| `asset#properties#asset:prop:id`  | The value of this field has to match the following pattern **[DIGITAL_TWIN_ID]-[DIGITAL_TWIN_SUBMODEL_ID]**. The Digital Twin Registry allows you to set the ids by yourself. You can generate the ids (UUIDv4) for the EDC Asset and use the same ids to create the Digital Twin and Submodel in the Digital Twin Registry. For an example, please have a look at the Postman collection. |
| `dataAddress#properties#endpoint` | This is the URL of your submodel server that provides the data we created in **Step 1**. You are free to define the URL on your own. The only requirement is that it returns the requested data for the Digital Twins submodel.**                                                                                                                                                          |


##### Note Action
Please run the request `2. Create an EDC Asset` of the **Postman** collection.

#### Step 3: Create an EDC policy

The request payload to create an EDC policy is:

```json
{
  // {{edcPolicyId}}
  "uid": "231802-bb34-11ec-8422-0242ac120002",
  "permissions": [
    {
      // {{digitalTwinId}}-{{digitalTwinSubmodelId}}
      // highlight-next-line 
      "target": "urn:uuid:365e6fbe-bb34-11ec-8422-0242ac120002-urn:uuid:61125dc3-5e6f-4f4b-838d-447432b97918",
      "action": {
        "type": "USE"
      },
      "edctype": "dataspaceconnector:permission"
    }
  ],
  "@type": {
    "@policytype": "set"
  }
}
```

| Field                   | Description                                                   |
|-------------------------|---------------------------------------------------------------|
| `permissions[0]#target` | Must match the EDC asset id `asset#properties#asset:prop:id`. |

##### Note Action
Please run the request `3. Create an EDC policy` in the **Postman** collection.

#### Step 4: Create a EDC contract definition

The request payload for the creating an EDC contract definition is:

```json
{
  "id": "1",
  // {{edcPolicyId}}
  // highlight-next-line
  "accessPolicyId": "231802-bb34-11ec-8422-0242ac120002",
  // {{edcPolicyId}}
  // highlight-next-line
  "contractPolicyId": "231802-bb34-11ec-8422-0242ac120002",
  "criteria": []
}
```

| Field              | Description                                               |
|--------------------|-----------------------------------------------------------|
| `accessPolicyId`   | Must match the EDC policy uuid.                           |
| `contractPolicyId` | Must match the EDC policy uuid. |


##### Note Action
Please run the request `3. Create an EDC Contract definition` of the **Postman** collection.

#### Step 5: Register digital twin with a reference to submodel data

The Digital Twin Registry is like an address book. By registering a digital twin you enable data consumers to access your data.
The payload for the creation of a digital twin is:

```json
{
    // "description" omitted
    "globalAssetId": {
        "value": [
            // highlight-next-line
            "{{digitalTwinId}}"
        ]
    },
    "idShort": "BMW 520e Plugin-Hybrid",
    // urn:uuid:365e6fbe-bb34-11ec-8422-0242ac120002
    // highlight-next-line
    "identification": "urn:uuid:365e6fbe-bb34-11ec-8422-0242ac120002",
    // highlight-next-line
    "specificAssetIds": [
        {
            "key": "PartNumber",
            "value": "31BK"
        },
        {
            "key": "VAN",
            "value": "7e97f714-0785-3f9d-ac37-b31989097be3"
        }
    ],
    "submodelDescriptors": [
        {
            // "description" omitted
            "idShort": "traceability",
            // {{digitalTwinSubmodelId}}
            // highlight-next-line
            "identification": "urn:uuid:61125dc3-5e6f-4f4b-838d-447432b97918",
            "semanticId": {
                "value": [
                    // highlight-next-line
                    "urn:bamm:com.catenax.battery.product_description:1.0.1#ProductDescription"
                ]
            },
            "endpoints": [
                {
                    "interface": "SUBMODEL-1.0RC02",
                    "protocolInformation": {
                        // {{providerControlPlaneDockerInternal}}/{{providerBpn}}/{{digitalTwinId}}-{{digitalTwinSubmodelId}}
                        // highlight-next-line
                        "endpointAddress": "http://provider-control-plane:8080/some-bpn/urn:uuid:365e6fbe-bb34-11ec-8422-0242ac120002-urn:uuid:61125dc3-5e6f-4f4b-838d-447432b97918/submodel?content=value&extent=withBlobValue",
                        "endpointProtocol": "IDS/ECLIPSE DATASPACE CONNECTOR",
                        "endpointProtocolVersion": "0.0.1-SNAPSHOT"
                    }
                }
            ]
        }
    ]
}
```

| Field                                                                     | Description                                                                                                                                                                                                                                                                                            |
|---------------------------------------------------------------------------|--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------|
| `globalAssetId#value[0]`                                                  | The global asset id is meant to identify a physical asset uniquely. The MAC-Address a real world example. In the manufacturing world such a global asset id does not yet exist. Therefore the value here must be equal to the Digital Twin id (#identification).                                       |
| `specificAssetIds`                                                        | Your digital twin can be searched for by specificAssetIds.                                                                                                                                                                                                                                             |
| `identification`                                                          | The uuid you can set by yourself.                                                                                                                                                                                                                                                                      |
| `submodeldescriptors[0]#identification`                                   | The uuid you can set by yourself.                                                                                                                                                                                                                                                                      |
| `submodeldescriptors[0]#semanticId[0]#value`                              | The urn of the Semantic Model. The Semantic Model describes the structure of the data your submodel endpoint returns. It is the structure definition that a data consumer expects when calling your submodel endpoint.                                                                                 |
| `submodeldescriptors[0]#endpoints[0]#protocolInformation#endpointAddress` | The URL must be structured as in the example above. The URL contains the Business-Partner-Number (BPN) and the asset id (**[DIGITAL_TWIN_ID]-[DIGITAL_TWIN_SUBMODEL_ID]**) which is used to filter for an EDC Asset to get the endpoint of your submodel endpoint in `dataAddress#properties#endpoint`. |

##### Note Action
Please run the request `5. Create a Digital Twin` of the **Postman** collection.

### Request data of a digital twin 

In this section, we will focus on the steps a **Data Consumer** has to follow.

<details>
    <summary>
      Actor: Data Consumer
    </summary>
    <div>
      The Data Consumer are accessing the Digital Twin Registry to discover and consume data from the Submodel Descriptor Endpoints. 
      Searching the Digital Twin Registry and requesting data of a digital twin are the main interests of a Data Consumer. 
    </div>
</details>

##### Note Info 
The folder **Data Consumer** of the Postman collection contains the API calls for this section.

#### Step 1: Query for a Digital Twin

To find the Digital Twin we created earlier we can use the lookup API of the Digital Twin Registry.
The lookup API requires us to provide `specificAssetIds` of the Digital Twin that we want to search for.

The API expects the `specificAssetIds` as `URL` encoded `JSON Array` query parameter.

Please open the Postman request `1. Query for a Digital Twin` and note the `assetId` query parameter.
You can decode the value with Postman to make it more readable. Mark the complete value, right-click and use the button `DecodeURIComponent`.

![End-To-End interaction](assets/catenax-at-home/postman-assetids-decode.png)

The decoded value is as below. Note that the key and value of the entry match exactly the `specificAssetIds` of the DigitalTwin we created.
The API returns all DigitalTwins matching the key-value pair. If you want to avoid multiple results you can query more specifically by providing multiple key-value pairs.

```json
[
  {
    "key": "PartNumber",
    "value": "31BK"
  }
]
```

##### Note Action
Please run the request `1. Query for a Digital Twin` of the **Postman** collection.

The response contains the `identification` of our Digital Twin.

#### Step 2: Get Digital Twin by identification

We can now use the found `identification` to get the complete details of our Digital Twin. 

##### Note Action
Please run the request `1.2 Query for a Digital Twin` of the **Postman** collection.

You may already notice that the `URL` we executed the previous request is targeted to the **AAS Proxy**.
The **AAS Proxy** abstracts the resolution of the `SubmodelDescriptor` endpoint addresses to **API-Wrapper** compatible endpoints.
The **API-Wrapper** is an essential component and handles all the `EDC` complexities for you.

Take a look to the `SubmodelDescriptor#endpoints#endpointAddress` in the response.

```json
"submodelDescriptors": [
        {
            ...
            "endpoints": [
                {
                    "interface": "SUBMODEL-1.0RC02",
                    "protocolInformation": {
                        // highlight-next-line
                        "endpointAddress": "http://localhost:4245/shells/urn:uuid:365e6fbe-bb34-11ec-8422-0242ac120002/aas/urn:uuid:61125dc3-5e6f-4f4b-838d-447432b97918/submodel?content=value&extent=withBlobValue",
                        "endpointProtocol": "HTTP",
                        "endpointProtocolVersion": "1.1"
                    }
                }
            ],
          
        }
    ]
```

The endpoint address is different from what we registered in `Step 5`.
Please run the Postman Request `1.2 NON-PROXY Query for a Digital Twin` of the **Postman** collection.
The request is targeted directly to the Digital Twin registry.

```json
"submodelDescriptors": [
        {
            ...
            "endpoints": [
                {
                    "interface": "SUBMODEL-1.0RC02",
                    "protocolInformation": {
                        // highlight-next-line
                        "endpointAddress": "http://provider-control-plane:8090/some-bpn/urn:uuid:365e6fbe-bb34-11ec-8422-0242ac120002-urn:uuid:61125dc3-5e6f-4f4b-838d-447432b97918/submodel?content=value&extent=withBlobValue",
                        "endpointProtocol": "IDS/ECLIPSE DATASPACE CONNECTOR",
                        "endpointProtocolVersion": "0.0.1-SNAPSHOT"
                    }
                }
            ]
        }
    ]
```

The AAS Proxy rewrites the URL to itself. `localhost:4245` is the local address of the AAS Proxy.
If you invoke the endpoint address of the `SubmodelDescriptor` the AAS Proxy will call the **API-Wrapper** which in turn requests the data through the EDC connectors.

#### Step 3: Get Submodel Data

Finally, we can request the data created in `Step 1`. 

##### Note Action
Please run the request `2. /submodel - Get submodel data` of the **Postman** collection.

Note that the URL is the same as the `SubmodelDescriptor` endpoint of our Digital Twin we requested from the **AAS Proxy**.

The Postman request `2.1 /submodel - WITHOUT-AAS-PROXY` contains an example of the API call against the **AAS Proxy** issues against the **API-Wrapper**.
This detail is important for you when you do not want to deploy the AAS Proxy so that you can replicate the logic in your solution.

Congratulations, you successfully finished the guide!

##### Warning
 Please note that all docker images used in this guide are not meant to be used in production.
 They are all configured with in-memory databases and predefined SSL certificates.
