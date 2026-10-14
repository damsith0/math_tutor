import ballerina/ai;
import ballerina/ai.eval;
import ballerina/test;

isolated function loadEvalsetData() returns map<[ai:ConversationThread]>|error {
    return ai:loadConversationThreads("tests/resources/evalsets/math-tutor.evalset.json");
}

@test:Config {
    groups: ["evaluations"],
    minPassRate: 0.7,
    dataProvider: loadEvalsetData
}
function evaluateMathTutorAgentToolTrajectory(ai:ConversationThread thread) returns error? {
    check eval:evaluateToolTrajectory(targetAgent = mathTutorAgent, thread = thread);
}
