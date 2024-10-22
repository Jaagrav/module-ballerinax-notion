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

# Author of the database
public type ObjectProperties_Author record {
    # Author ID
    string id?;
    ObjectProperties_Author_multi_select multi_select?;
    # The type of the object
    string 'type?;
};

# Page properties
public type PageProperties record {
    # The ID of the property
    string name?;
    # Type of the property
    string 'type?;
};

# The filter item
public type DatabaseContent_filter_or record {
    # The filter property
    string property?;
    DatabaseContent_filter_select 'select?;
};

# Object Properties
public type ObjectProperties record {
    ObjectProperties_Author Author?;
    ObjectProperties_Link Link?;
    ObjectProperties_Name Name?;
    ObjectProperties_Publisher Publisher?;
    ObjectProperties_PublishingRelease\ Date Publishing\/Release\ Date?;
    ObjectProperties_Read Read?;
    ObjectProperties_Status Status?;
    ObjectProperties_Summary Summary?;
    ObjectProperties_Type Type?;
};

# Represents the Headers record for the operation: queryDatabase
public type QueryDatabaseHeaders record {
    # API Version
    string? Notion\-Version = "2022-06-28";
};

public type ObjectProperties_PublishingRelease\ Date record {
    record {} date?;
    string id?;
    string 'type?;
};

# Result Details
public type ResultDetails record {
    # The created date/time
    string created_time?;
    # Indicates whether it has child object or not
    boolean has_children?;
    # Object ID
    string id?;
    # The last date/time
    string last_edited_time?;
    # Object Category
    string 'object?;
    # object type
    string 'type?;
    # Unsupported
    record {} unsupported?;
};

# Text value
public type PageUpdateRequestBody_heading_2_text record {
    # Text content
    string content?;
};

# Style information which applies to the whole rich text object
public type Annotations record {
    # Whether the text is bolded
    boolean bold?;
    # Whether the text is italic
    boolean italic?;
    # Whether the text is struck through
    boolean strikethrough?;
    # Whether the text is underlined
    boolean underline?;
    # Whether the text is "code style"
    boolean code?;
    # Color of the text. Possible values are- "default", "gray", "brown", "orange", "yellow", "green", "blue", "purple", "pink", "red", "gray_background", "brown_background", "orange_background", "yellow_background", "green_background", "blue_background", "purple_background", "pink_background", "red_background"
    string color?;
};

# Sort items
public type DatabaseContent_sorts record {
    # The sort direction
    string direction?;
    # The sort property
    string property?;
};

# Parent Page
public type PageResponse_parent record {
    # Database ID
    string database_id?;
    # The type of the object
    string 'type?;
};

# Represents the Queries record for the operation: listAllUsers
public type ListAllUsersQueries record {
    # If supplied, this endpoint will return a page of results starting after the cursor provided. If not supplied, this endpoint will return the first page of results.
    string start_cursor?;
    # The number of items from the full list desired in the response. Maximum- 100
    int page_size?;
};

# The database object
public type Database record {
    # The created date/time
    string created_time?;
    # Database ID
    string id?;
    # The last edited date/time
    string last_edited_time?;
    # Object type "database"
    string 'object?;
    ObjectProperties properties?;
    # Title of the database
    Database_title[] title?;
};

# Filter detail
public type DatabaseContent_filter record {
    # The filter set
    DatabaseContent_filter_or[] or?;
};

# The select details
public type DatabaseContent_filter_select record {
    # The equals values
    string 'equals?;
};

# The text detail
public type Database_text record {
    # The text content
    string content?;
    # The link to the text
    anydata? link?;
};

# Provides a set of configurations for controlling the behaviours when communicating with a remote HTTP endpoint.
@display {label: "Connection Config"}
public type ConnectionConfig record {|
    # Configurations related to client authentication
    http:BearerTokenConfig auth;
    # The HTTP version understood by the client
    http:HttpVersion httpVersion = http:HTTP_2_0;
    # Configurations related to HTTP/1.x protocol
    ClientHttp1Settings http1Settings?;
    # Configurations related to HTTP/2 protocol
    http:ClientHttp2Settings http2Settings?;
    # The maximum time to wait (in seconds) for a response before closing the connection
    decimal timeout = 60;
    # The choice of setting `forwarded`/`x-forwarded` header
    string forwarded = "disable";
    # Configurations associated with request pooling
    http:PoolConfiguration poolConfig?;
    # HTTP caching related configurations
    http:CacheConfig cache?;
    # Specifies the way of handling compression (`accept-encoding`) header
    http:Compression compression = http:COMPRESSION_AUTO;
    # Configurations associated with the behaviour of the Circuit Breaker
    http:CircuitBreakerConfig circuitBreaker?;
    # Configurations associated with retrying
    http:RetryConfig retryConfig?;
    # Configurations associated with inbound response size limits
    http:ResponseLimitConfigs responseLimits?;
    # SSL/TLS-related options
    http:ClientSecureSocket secureSocket?;
    # Proxy server related options
    http:ProxyConfig proxy?;
    # Enables the inbound payload validation functionality which provided by the constraint package. Enabled by default
    boolean validation = true;
|};

# Property schema of database. The keys are the names of properties as they appear in Notion and the values are property schema objects
public type DatabaseProperties record {
    # Each database must have exactly one database property schema object of type "title". This database property controls the title that appears at the top of the page when the page is opened.
    string title?;
    # Text database property schema objects
    string rich_text?;
    DatabaseProperties_number number?;
    SelectOptions 'select?;
    # Multi-select database property schema object
    SelectOptions[] multi_select?;
    # Date database property schema
    string date?;
    # People database property schema
    string people?;
    # File database property schema object
    string files?;
    # Checkbox database property schema object
    string checkbox?;
    # URL database property schema object
    string url?;
    # Email database property schema object
    string email?;
    # Phone number database property schema object
    string phone_number?;
    # Last edited time database property schema object
    string last_edited_time?;
    # Last edited by database property schema object
    string last_edited_by?;
    # Created time database property schema object
    string created_time?;
    # Created by database property schema object
    string created_by?;
};

# DatabaseDetails
public type DatabaseBodyParams record {
    DatabaseProperties properties?;
    DatabaseParent parent?;
    # Property schema of database
    DatabaseTitle[] title?;
};

# Select option
public type SelectOptions record {
    # Name of the option as it appears in Notion
    string name?;
    # Color of the option. Possible values include- default, gray, brown, orange, yellow, green, blue, purple, pink, red
    string color?;
};

# Page heading
public type PageUpdateRequestBody_heading_2 record {
    # Page text
    PageUpdateRequestBody_heading_2_text_1[] text?;
};

# Status properties
public type PageContent_properties_Status record {
    PageContent_properties_Status_select 'select?;
};

# The database type details
public type ObjectProperties_Type record {
    # The type ID
    string id?;
    ObjectProperties_Publisher_select 'select?;
    # The object type
    string 'type?;
};

# The contact detail
public type User_person record {
    # Email address
    string email?;
};

# Represents the Headers record for the operation: retrievePage
public type RetrievePageHeaders record {
    # API Version
    string? Notion\-Version = "2022-06-28";
};

# Page content for the new page
public type PageChildren PageChildren_inner[];

# Page properties
public type PageContent_properties record {
    PageContent_properties_Status Status?;
};

# Represents the Headers record for the operation: listAllDatabases
public type ListAllDatabasesHeaders record {
    # API Version
    string? Notion\-Version = "2022-06-28";
};

# Database content
public type DatabaseContent record {
    DatabaseContent_filter filter?;
    # Sorting details
    DatabaseContent_sorts[] sorts?;
};

# Represents the Queries record for the operation: listAllDatabases
public type ListAllDatabasesQueries record {
    # If supplied, this endpoint will return a page of results starting after the cursor provided. If not supplied, this endpoint will return the first page of results.
    string start_cursor?;
    # The number of items from the full list desired in the response. Maximum- 100
    int page_size?;
};

# Number database property schema object
public type DatabaseProperties_number record {
    # How the number is displayed in Notion. Potential values include- number, number_with_commas, percent, dollar, euro, pound, yen, ruble, rupee, won, yuan
    string format?;
};

# User detail
public type User record {
    # avatar URL
    anydata? avatar_url?;
    # User ID
    string id?;
    # Name of the User
    string name?;
    # The object type User
    string 'object?;
    User_person person?;
    # The object type
    string 'type?;
};

# Select details of publisher
public type ObjectProperties_Publisher_select record {
    # The set of options
    ObjectProperties_Publisher_select_options[] options?;
};

# Represents the Headers record for the operation: searchPages
public type SearchPagesHeaders record {
    # API Version
    string? Notion\-Version = "2022-06-28";
};

# Database response content
public type DatabaseResponse record {
    # Indicates whether has more objects
    boolean has_more?;
    # The next position of the result
    anydata? next_cursor?;
    # Object Type "list"
    string 'object?;
    # Database results
    DatabaseResponse_results[] results?;
};

# The page content after update
public type PageUpdatedProperties record {
    # Indicates whether it is archived or not
    boolean archived?;
    # The created date/time
    string created_time?;
    # The ID of the Page
    string id?;
    # The last edited date/time
    string last_edited_time?;
    # The object type "page"
    string 'object?;
    ObjectProperties properties?;
};

# The status ID
public type ObjectProperties_Status record {
    # The ID of the status
    string id?;
    ObjectProperties_Publisher_select 'select?;
    # The object type
    string 'type?;
};

# The response body for users list
public type PaginatedUsers record {
    # Array of Users
    User[] results?;
    # Next curser position of the user list
    string? next_cursor?;
    # Indicates whether there are more user records or not
    boolean has_more?;
};

# Read details
public type ObjectProperties_Read record {
    # checkbox details
    record {} checkbox?;
    # ID of the checkbox
    string id?;
    # The object type
    string 'type?;
};

# PageDetail
public type PageBodyParams record {
    PageProperties properties?;
    PageParent parent?;
    PageChildren children?;
};

# The request body for page update
public type PageUpdateRequestBody record {
    # Children pages
    PageUpdateRequestBody_children[] children?;
};

# Page content
public type PageContent record {
    PageContent_properties properties?;
};

# Child block details
public type ChildBlockContent record {
    ChildBlockContent_child_page child_page?;
    # The created date/time
    string created_time?;
    # Indicates whether it has children blocks
    boolean has_children?;
    # ID of the block
    string id?;
    # The last edited date/time
    string last_edited_time?;
    # Always "block" for block types
    string 'object?;
    # Type of the block. Possible values include "paragraph", "heading_1", "heading_2", "heading_3", "bulleted_list_item" etc.
    string 'type?;
};

# Represents the Headers record for the operation: listAllUsers
public type ListAllUsersHeaders record {
    # API Version
    string? Notion\-Version = "2022-06-28";
};

# Page properties
public type DatabaseTitle record {
    # The plain text without annotations
    string plain_text?;
    # The URL of any link or internal Notion mention in this text, if any
    string href?;
    # Type of this rich text object. Possible values are- "text", "mention", "equation"
    string 'type?;
    Annotations 'annotation?;
};

# The response for block children
public type BlockChildrenResponse record {
    # Indicates whether it has more objects or not
    boolean has_more?;
    # Incidates the position of the response list
    anydata? next_cursor?;
    # The response object
    string 'object?;
    # The array of result details
    ResultDetails[] results?;
};

# The parent database
public type DatabaseResponse_parent record {
    # Database ID
    string database_id?;
    # The type of object
    string 'type?;
};

# Publisher Detail
public type ObjectProperties_Publisher record {
    # Publisher ID
    string id?;
    ObjectProperties_Publisher_select 'select?;
    # The type of the object
    string 'type?;
};

# The set of items in options
public type ObjectProperties_Publisher_select_options record {
    # The color
    string color?;
    # The ID of the option
    string id?;
    # The name of the option
    string name?;
};

# Page Details
public type PageResponse record {
    # Indicates whether it is archived or not
    boolean archived?;
    # The created date/time
    string created_time?;
    # ID of the page
    string id?;
    # The last edited date/time
    string last_edited_time?;
    # The object type "page"
    string 'object?;
    PageResponse_parent parent?;
    ObjectProperties properties?;
};

# The item sets
public type Database_title record {
    Database_annotations annotations?;
    # HyperLink
    anydata? href?;
    # Plain text
    string plain_text?;
    Database_text text?;
    # The type of the object
    string 'type?;
};

# Child page
public type ChildBlockContent_child_page record {
    # Title of the page
    string title?;
};

# Select properties
public type PageContent_properties_Status_select record {
    # page content name
    string name?;
};

# The option items
public type ObjectProperties_Author_multi_select_options record {
    # Color of the database
    string color?;
    # ID of the database
    string id?;
    # Name of the Database
    string name?;
};

# Related links
public type ObjectProperties_Link record {
    # Link ID
    string id?;
    # Link type
    string 'type?;
    # URL
    record {} url?;
};

# Represents the Headers record for the operation: retrieveUser
public type RetrieveUserHeaders record {
    # API Version
    string? Notion\-Version = "2022-06-28";
};

# The summary of the database
public type ObjectProperties_Summary record {
    # The ID of the summary
    string id?;
    # The summary content
    record {} text?;
    # The type of the object
    string 'type?;
};

# Parent Page Detail
public type PageParent record {
    # Database ID
    string database_id?;
};

# The databases
public type DatabaseResponse_results record {
    # Indicates whether the database is archived or not
    boolean archived?;
    # Indicates whether the database is archived or not
    string created_time?;
    # The ID of the database
    string id?;
    # The last edited time
    string last_edited_time?;
    # The object type "page"
    string 'object?;
    DatabaseResponse_parent parent?;
    ObjectProperties properties?;
};

# Parent Page Detail
public type DatabaseParent record {
    # Database ID
    string page_id?;
};

# The annotation
public type Database_annotations record {
    # Indicates whether the title is bold or not
    boolean bold?;
    # Indicates whether the title is code or not
    boolean code?;
    # Indicates whether the title is color or not
    string color?;
    # Indicates whether the title is italic or not
    boolean italic?;
    # Indicates whether the title is strikethrough or not
    boolean strikethrough?;
    # Indicates whether the title is underline or not
    boolean underline?;
};

# Represents the Headers record for the operation: retrieveDatabase
public type RetrieveDatabaseHeaders record {
    # API Version
    string? Notion\-Version = "2022-06-28";
};

# Proxy server configurations to be used with the HTTP client endpoint.
public type ProxyConfig record {|
    # Host name of the proxy server
    string host = "";
    # Proxy server port
    int port = 0;
    # Proxy server username
    string userName = "";
    # Proxy server password
    @display {label: "", kind: "password"}
    string password = "";
|};

# Represents the Headers record for the operation: updatePageProperties
public type UpdatePagePropertiesHeaders record {
    # API Version
    string? Notion\-Version = "2022-06-28";
};

# The name of the object
public type ObjectProperties_Name record {
    # Name ID
    string id?;
    # tilte
    record {} title?;
    # title Type
    string 'type?;
};

# Represents the Queries record for the operation: retrieveBlockChildren
public type RetrieveBlockChildrenQueries record {
    # Page size
    string page_size?;
};

# multi_select values
public type ObjectProperties_Author_multi_select record {
    # The multi_select option
    ObjectProperties_Author_multi_select_options[] options?;
};

# Block content
public type blockContent record {
    # block objects
    blockContent_text[] text?;
};

# Represents the Headers record for the operation: retrieveBlockChildren
public type RetrieveBlockChildrenHeaders record {
    # API Version
    string? Notion\-Version = "2022-06-28";
};

# page items
public type PageUpdateRequestBody_children record {
    PageUpdateRequestBody_heading_2 heading_2?;
    # The page object "block"
    string 'object?;
    # The type of the object
    string 'type?;
};

# Provides settings related to HTTP/1.x protocol.
public type ClientHttp1Settings record {|
    # Specifies whether to reuse a connection for multiple requests
    http:KeepAlive keepAlive = http:KEEPALIVE_AUTO;
    # The chunking behaviour of the request
    http:Chunking chunking = http:CHUNKING_AUTO;
    # Proxy server related options
    ProxyConfig proxy?;
|};

public type blockContent_text record {
    # block objects
    blockContent[] text?;
    # Any nested children blocks
    blockContent[] children?;
    # Whether the to_do is checked or not
    boolean checked?;
    # Content of a block element
    string content?;
};

# Page content for the new pag
public type PageChildren_inner record {
    # Always "block"
    string 'object = "block";
    # Type of block
    string 'type?;
    blockContent paragraph?;
    blockContent heading_1?;
    blockContent heading_2?;
    blockContent heading_3?;
    blockContent bulleted_list_item?;
    blockContent numbered_list_item?;
    blockContent to_do?;
    blockContent child_page?;
};

# Represents the Headers record for the operation: createDatabase
public type CreateDatabaseHeaders record {
    # API Version
    string? Notion\-Version = "2022-06-28";
};

# Page text items
public type PageUpdateRequestBody_heading_2_text_1 record {
    PageUpdateRequestBody_heading_2_text text?;
    # The type of the object
    string 'type?;
};

# Represents the Headers record for the operation: createPage
public type CreatePageHeaders record {
    # API Version
    string? Notion\-Version = "2022-06-28";
};

# Represents the Headers record for the operation: appendBlockChildren
public type AppendBlockChildrenHeaders record {
    # API Version
    string? Notion\-Version = "2022-06-28";
};
