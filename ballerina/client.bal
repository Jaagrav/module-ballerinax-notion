// Copyright (c) 2024, WSO2 LLC. (http://www.wso2.com).
//
// WSO2 LLC. licenses this file to you under the Apache License,
// Version 2.0 (the "License"); you may not use this file except
// in compliance with the License.
// You may obtain a copy of the License at
//
// http://www.apache.org/licenses/LICENSE-2.0
//
// Unless required by applicable law or agreed to in writing,
// software distributed under the License is distributed on an
// "AS IS" BASIS, WITHOUT WARRANTIES OR CONDITIONS OF ANY
// KIND, either express or implied.  See the License for the
// specific language governing permissions and limitations
// under the License.

import ballerina/http;

# This is a generated connector for [Notion API v1](https://developers.notion.com/reference/intro) OpenAPI Specification.
# Notion API provides capability to access all-in-one workspace where you can write, plan, collaborate and get organized. it has components such as notes, databases, kanban boards, wikis, calendars, and reminders. You can connect these components to take notes, add tasks, manage projects & more. Notion provides the building blocks and you can create your own layouts and toolkit to get work done. This ballerina connector allows you to connect Notion through its [REST API](https://developers.notion.com/docs).
@display {label: "Notion", iconPath: "icon.png"}
public isolated client class Client {
    final http:Client clientEp;
    # Gets invoked to initialize the `connector`.
    # The connector initialization requires setting the API credentials. 
    # Create a [Notion account](https://www.notion.so/)  and obtain tokens following [this guide](https://developers.notion.com/docs/authorization).
    #
    # + config - The configurations to be used when initializing the `connector` 
    # + serviceUrl - URL of the target service 
    # + return - An error if connector initialization failed 
    public isolated function init(ConnectionConfig config, string serviceUrl = "https://api.notion.com") returns error? {
        http:ClientConfiguration httpClientConfig = {auth: config.auth, httpVersion: config.httpVersion, timeout: config.timeout, forwarded: config.forwarded, poolConfig: config.poolConfig, compression: config.compression, circuitBreaker: config.circuitBreaker, retryConfig: config.retryConfig, validation: config.validation};
        do {
            if config.http1Settings is ClientHttp1Settings {
                ClientHttp1Settings settings = check config.http1Settings.ensureType(ClientHttp1Settings);
                httpClientConfig.http1Settings = {...settings};
            }
            if config.http2Settings is http:ClientHttp2Settings {
                httpClientConfig.http2Settings = check config.http2Settings.ensureType(http:ClientHttp2Settings);
            }
            if config.cache is http:CacheConfig {
                httpClientConfig.cache = check config.cache.ensureType(http:CacheConfig);
            }
            if config.responseLimits is http:ResponseLimitConfigs {
                httpClientConfig.responseLimits = check config.responseLimits.ensureType(http:ResponseLimitConfigs);
            }
            if config.secureSocket is http:ClientSecureSocket {
                httpClientConfig.secureSocket = check config.secureSocket.ensureType(http:ClientSecureSocket);
            }
            if config.proxy is http:ProxyConfig {
                httpClientConfig.proxy = check config.proxy.ensureType(http:ProxyConfig);
            }
        }
        http:Client httpEp = check new (serviceUrl, httpClientConfig);
        self.clientEp = httpEp;
        return;
    }

    # Delete a block
    #
    # + headers - Headers to be sent with the request 
    # + return - OK 
    resource isolated function delete v1/blocks/[string id](DeleteV1BlocksIdHeaders headers = {}) returns record {}|error {
        string resourcePath = string `/v1/blocks/${getEncodedUri(id)}`;
        map<string|string[]> httpHeaders = getMapForHeaders(headers);
        return self.clientEp->delete(resourcePath, headers = httpHeaders);
    }

    # Retrieve a block
    #
    # + headers - Headers to be sent with the request 
    # + return - OK 
    resource isolated function get v1/blocks/[string id](GetV1BlocksIdHeaders headers = {}) returns record {}|error {
        string resourcePath = string `/v1/blocks/${getEncodedUri(id)}`;
        map<string|string[]> httpHeaders = getMapForHeaders(headers);
        return self.clientEp->get(resourcePath, httpHeaders);
    }

    # Retrieve block children
    #
    # + headers - Headers to be sent with the request 
    # + queries - Queries to be sent with the request 
    # + return - OK 
    resource isolated function get v1/blocks/[string id]/children(GetV1BlocksIdChildrenHeaders headers = {}, *GetV1BlocksIdChildrenQueries queries) returns record {}|error {
        string resourcePath = string `/v1/blocks/${getEncodedUri(id)}/children`;
        resourcePath = resourcePath + check getPathForQueryParam(queries);
        map<string|string[]> httpHeaders = getMapForHeaders(headers);
        return self.clientEp->get(resourcePath, httpHeaders);
    }

    # Retrieve comments
    #
    # + headers - Headers to be sent with the request 
    # + queries - Queries to be sent with the request 
    # + return - OK 
    resource isolated function get v1/comments(GetV1CommentsHeaders headers = {}, *GetV1CommentsQueries queries) returns record {}|error {
        string resourcePath = string `/v1/comments`;
        resourcePath = resourcePath + check getPathForQueryParam(queries);
        map<string|string[]> httpHeaders = getMapForHeaders(headers);
        return self.clientEp->get(resourcePath, httpHeaders);
    }

    # Retrieve a database
    #
    # + headers - Headers to be sent with the request 
    # + return - OK 
    resource isolated function get v1/databases/[string id](GetV1DatabasesIdHeaders headers = {}) returns record {}|error {
        string resourcePath = string `/v1/databases/${getEncodedUri(id)}`;
        map<string|string[]> httpHeaders = getMapForHeaders(headers);
        return self.clientEp->get(resourcePath, httpHeaders);
    }

    # Retrieve a page
    #
    # + headers - Headers to be sent with the request 
    # + return - OK 
    resource isolated function get v1/pages/[string id](GetV1PagesIdHeaders headers = {}) returns record {}|error {
        string resourcePath = string `/v1/pages/${getEncodedUri(id)}`;
        map<string|string[]> httpHeaders = getMapForHeaders(headers);
        return self.clientEp->get(resourcePath, httpHeaders);
    }

    # Retrieve a page property item
    #
    # + headers - Headers to be sent with the request 
    # + return - OK 
    resource isolated function get v1/pages/[string pageId]/properties/[string propertyId](GetV1PagesPageidPropertiesPropertyidHeaders headers = {}) returns record {}|error {
        string resourcePath = string `/v1/pages/${getEncodedUri(pageId)}/properties/${getEncodedUri(propertyId)}`;
        map<string|string[]> httpHeaders = getMapForHeaders(headers);
        return self.clientEp->get(resourcePath, httpHeaders);
    }

    # List all users
    #
    # + headers - Headers to be sent with the request 
    # + return - OK 
    resource isolated function get v1/users(GetV1UsersHeaders headers = {}) returns record {}|error {
        string resourcePath = string `/v1/users`;
        map<string|string[]> httpHeaders = getMapForHeaders(headers);
        return self.clientEp->get(resourcePath, httpHeaders);
    }

    # Retrieve a user by ID or bot user (when id is "me")
    #
    # + headers - Headers to be sent with the request
    # + return - OK
    resource isolated function get v1/users/[string id](GetV1UsersIdHeaders headers = {}) returns record {}|error {
        string resourcePath;

        // If the ID is "me", use the path for the bot user
        if id == "me" {
            resourcePath = string `/v1/users/me`;
        } else {
            resourcePath = string `/v1/users/${getEncodedUri(id)}`;
        }

        map<string|string[]> httpHeaders = getMapForHeaders(headers);
        return self.clientEp->get(resourcePath, httpHeaders);
    }

    # Update a block
    #
    # + headers - Headers to be sent with the request 
    # + return - OK 
    resource isolated function patch v1/blocks/[string id](record {} payload, PatchV1BlocksIdHeaders headers = {}) returns record {}|error {
        string resourcePath = string `/v1/blocks/${getEncodedUri(id)}`;
        map<string|string[]> httpHeaders = getMapForHeaders(headers);
        http:Request request = new;
        json jsonBody = payload.toJson();
        request.setPayload(jsonBody, "application/json");
        return self.clientEp->patch(resourcePath, request, httpHeaders);
    }

    # Append block children
    #
    # + headers - Headers to be sent with the request 
    # + return - OK 
    resource isolated function patch v1/blocks/[string id]/children(record {} payload, PatchV1BlocksIdChildrenHeaders headers = {}) returns record {}|error {
        string resourcePath = string `/v1/blocks/${getEncodedUri(id)}/children`;
        map<string|string[]> httpHeaders = getMapForHeaders(headers);
        http:Request request = new;
        json jsonBody = payload.toJson();
        request.setPayload(jsonBody, "application/json");
        return self.clientEp->patch(resourcePath, request, httpHeaders);
    }

    # Update database properties
    #
    # + headers - Headers to be sent with the request 
    # + return - OK 
    resource isolated function patch v1/databases/[string id](record {} payload, PatchV1DatabasesIdHeaders headers = {}) returns record {}|error {
        string resourcePath = string `/v1/databases/${getEncodedUri(id)}`;
        map<string|string[]> httpHeaders = getMapForHeaders(headers);
        http:Request request = new;
        json jsonBody = payload.toJson();
        request.setPayload(jsonBody, "application/json");
        return self.clientEp->patch(resourcePath, request, httpHeaders);
    }

    # Archive a page
    #
    # + headers - Headers to be sent with the request 
    # + return - OK 
    resource isolated function patch v1/pages/[string id](record {} payload, PatchV1PagesIdHeaders headers = {}) returns record {}|error {
        string resourcePath = string `/v1/pages/${getEncodedUri(id)}`;
        map<string|string[]> httpHeaders = getMapForHeaders(headers);
        http:Request request = new;
        json jsonBody = payload.toJson();
        request.setPayload(jsonBody, "application/json");
        return self.clientEp->patch(resourcePath, request, httpHeaders);
    }

    # Add comment to discussion
    #
    # + headers - Headers to be sent with the request 
    # + return - OK 
    resource isolated function post v1/comments(record {} payload, PostV1CommentsHeaders headers = {}) returns record {}|error {
        string resourcePath = string `/v1/comments`;
        map<string|string[]> httpHeaders = getMapForHeaders(headers);
        http:Request request = new;
        json jsonBody = payload.toJson();
        request.setPayload(jsonBody, "application/json");
        return self.clientEp->post(resourcePath, request, httpHeaders);
    }

    resource isolated function post v1/databases(record {} payload, PostV1DatabasesHeaders headers = {}) returns record {}|error {
        string resourcePath = string `/v1/databases/`;
        map<string|string[]> httpHeaders = getMapForHeaders(headers);
        http:Request request = new;
        json jsonBody = payload.toJson();
        request.setPayload(jsonBody, "application/json");
        return self.clientEp->post(resourcePath, request, httpHeaders);
    }

    # Filter a database
    #
    # + headers - Headers to be sent with the request 
    # + return - OK 
    resource isolated function post v1/databases/[string id]/query(record {} payload, PostV1DatabasesIdQueryHeaders headers = {}) returns record {}|error {
        string resourcePath = string `/v1/databases/${getEncodedUri(id)}/query`;
        map<string|string[]> httpHeaders = getMapForHeaders(headers);
        http:Request request = new;
        json jsonBody = payload.toJson();
        request.setPayload(jsonBody, "application/json");
        return self.clientEp->post(resourcePath, request, httpHeaders);
    }

    resource isolated function post v1/pages(record {} payload, PostV1PagesHeaders headers = {}) returns record {}|error {
        string resourcePath = string `/v1/pages/`;
        map<string|string[]> httpHeaders = getMapForHeaders(headers);
        http:Request request = new;
        json jsonBody = payload.toJson();
        request.setPayload(jsonBody, "application/json");
        return self.clientEp->post(resourcePath, request, httpHeaders);
    }

    # Search
    #
    # + headers - Headers to be sent with the request 
    # + return - OK 
    resource isolated function post v1/search(record {} payload, PostV1SearchHeaders headers = {}) returns record {}|error {
        string resourcePath = string `/v1/search`;
        map<string|string[]> httpHeaders = getMapForHeaders(headers);
        http:Request request = new;
        json jsonBody = payload.toJson();
        request.setPayload(jsonBody, "application/json");
        return self.clientEp->post(resourcePath, request, httpHeaders);
    }
}
