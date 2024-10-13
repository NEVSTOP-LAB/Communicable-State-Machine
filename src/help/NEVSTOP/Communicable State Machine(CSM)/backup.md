#### Build Message with Arguments(Auto Check).vi

- <B>For Example:</B>

If <b>State with Arguments</b> input is "API: DoSth"
- <b>Arguments ("")</b> input is "Arguments"
- <b>Target Module ("")</b> input is "Callee"
Then result string is "API: DoSth >> Arguments" as no message symbol is detected.

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
Then result string is "API: DoSth >> NewArguments -@ Callee"

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

#### Build No-Reply Asynchronous Message with Arguments.vi

- <B>For Example:</B>

If <b>State with Arguments</b> input is "API: DoSth"
- <b>Arguments ("")</b> input is "Arguments"
- <b>Target Module ("")</b> input is "Callee"
Then result string is "API: DoSth >> Arguments ->| Callee". It's different with Build Message with Arguments(Auto Check).vi. Message Type Symbol is replaced with "->|".

If <b>State with Arguments</b> input is "API: DoSth >> Arguments -> Callee"
- <b>Arguments ("")</b> input is "NewArguments"
- <b>Target Module ("")</b> input is ""
Then result string is "API: DoSth >> NewArguments ->| Callee". Message Type Symbol is replaced with "->|".

If <b>State with Arguments</b> input is "API: DoSth >> Arguments -> Callee"
- <b>Arguments ("")</b> input is "NewArguments"
- <b>Target Module ("")</b> input is "NewCallee"
Then result string is "API: DoSth >> NewArguments ->| NewCallee". Message Type Symbol is replaced with "->|".

If <b>State with Arguments</b> input is "API: DoSth >> Arguments -> Callee"
- <b>Arguments ("")</b> input is ""
- <b>Target Module ("")</b> input is "NewCallee"
Then result string is "API: DoSth ->| NewCallee". Message Type Symbol is replaced with "->|".

If <b>State with Arguments</b> input is "API: DoSth >> Arguments -@ Callee"
- <b>Arguments ("")</b> input is "NewArguments"
- <b>Target Module ("")</b> input is ""
Then result string is "API: DoSth >> NewArguments ->| Callee". Message Type Symbol is replaced with "->|".

#### Build Normal Status Message.vi

- <B>For Example:</B>
If <b>State with Arguments</b> input is "API: DoSth"
Then result string is "API: DoSth >> Arguments" as no message symbol is detected.
If <b>State with Arguments</b> input is "API: DoSth >> Arguments -> Callee"
Then result string is "API: DoSth >> NewArguments -> Callee"
If <b>State with Arguments</b> input is "API: DoSth >> Arguments -> Callee"
Then result string is "API: DoSth >> NewArguments -> NewCallee"
If <b>State with Arguments</b> input is "API: DoSth >> Arguments -> Callee"
Then result string is "API: DoSth -> NewCallee"
If <b>State with Arguments</b> input is "API: DoSth >> Arguments -@ Callee"
Then result string is "API: DoSth >> NewArguments -@ Callee"
- <b>State with Arguments</b>: Input Message which might contain Arguments or target Module
- <b>Arguments ("")</b>: The arguments which will be used to replace arguments in <b>State with Arguments</b>. if empty, no arguments will be included in output strings.
- <b>Target Module ("")</b>: The target which will be used to replace target in <b>State with Arguments</b>. if empty, target in <b>State with Arguments</b> will be used.
- <b>State with Arguments</b>: String stands for state with arguments