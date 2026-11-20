import ballerina/workflow;

@workflow:Workflow
function orderWorkflow(workflow:Context ctx, OrderInfo input, OrderWorkflowData data) returns json|error {
    () _ = check ctx->callActivity(reserveInventory, {orderInfo: input});
    boolean payment = check wait data.payment;
    if payment {
        () _ = check ctx->callActivity(sendEmail, {orderInfo: input});
    } else {
        () _ = check ctx->callActivity(cancelOrder, {orderInfo: input});
    }

}
