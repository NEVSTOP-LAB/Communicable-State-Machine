#### Build Synchronous Message with Arguments.vi

- <B>For Example:</B>

If <b>State with Arguments</b> input is "API: DoSth"
- <b>Arguments ("")</b> input is "Arguments"
- <b>Target Module ("")</b> input is "Callee"
Then result string is "API: DoSth >> Arguments ->| Callee". It's different with Build Message with Arguments(Auto Check).vi. Message Type Symbol is replaced with "-@".

If <b>State with Arguments</b> input is "API: DoSth >> Arguments -> Callee"
- <b>Arguments ("")</b> input is "NewArguments"
- <b>Target Module ("")</b> input is ""
Then result string is "API: DoSth >> NewArguments ->| Callee". Message Type Symbol is replaced with "-@".

If <b>State with Arguments</b> input is "API: DoSth >> Arguments -> Callee"
- <b>Arguments ("")</b> input is "NewArguments"
- <b>Target Module ("")</b> input is "NewCallee"
Then result string is "API: DoSth >> NewArguments -@ NewCallee". Message Type Symbol is replaced with "-@".

If <b>State with Arguments</b> input is "API: DoSth >> Arguments -> Callee"
- <b>Arguments ("")</b> input is ""
- <b>Target Module ("")</b> input is "NewCallee"
Then result string is "API: DoSth -@ NewCallee". Message Type Symbol is replaced with "-@".

If <b>State with Arguments</b> input is "API: DoSth >> Arguments -@ Callee"
- <b>Arguments ("")</b> input is "NewArguments"
- <b>Target Module ("")</b> input is ""
Then result string is "API: DoSth >> NewArguments -@ Callee".

#### Build Asynchronous Message with Arguments.vi

- <B>For Example:</B>

If <b>State with Arguments</b> input is "API: DoSth"
- <b>Arguments ("")</b> input is "Arguments"
- <b>Target Module ("")</b> input is "Callee"
Then result string is "API: DoSth >> Arguments -> Callee". It's different with Build Message with Arguments(Auto Check).vi. . Message Type Symbol is replaced with "->".

If <b>State with Arguments</b> input is "API: DoSth >> Arguments -> Callee"
- <b>Arguments ("")</b> input is "NewArguments"
- <b>Target Module ("")</b> input is ""
Then result string is "API: DoSth >> NewArguments -> Callee"

If <b>State with Arguments</b> input is "API: DoSth >> Arguments -> Callee"
- <b>Arguments ("")</b> input is "NewArguments"
- <b>Target Module ("")</b> input is "NewCallee"
Then result string is "API: DoSth >> NewArguments -> NewCallee"

If <b>State with Arguments</b> input is "API: DoSth >> Arguments -> Callee"
- <b>Arguments ("")</b> input is ""
- <b>Target Module ("")</b> input is "NewCallee"
Then result string is "API: DoSth -> NewCallee"

If <b>State with Arguments</b> input is "API: DoSth >> Arguments -@ Callee"
- <b>Arguments ("")</b> input is "NewArguments"
- <b>Target Module ("")</b> input is ""
Then result string is "API: DoSth >> NewArguments -> Callee". Message Type Symbol is replaced with "->".