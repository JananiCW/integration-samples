import ballerina/log;
import ballerina/workflow;

@workflow:Activity
function reserveInventory(OrderInfo orderInfo) returns error? {
    log:printInfo("Inventory reserved");

}
