<?xml version="1.0" encoding="UTF-8"?>
<model ref="r:8ad218aa-30cf-43e1-943f-6aaa337bc0f1(jetbrains.mps.typechecking.sample.bounds@tests)">
  <persistence version="9" />
  <languages>
    <use id="f61473f9-130f-42f6-b98d-6c438812c2f6" name="jetbrains.mps.baseLanguage.unitTest" version="0" />
    <use id="8585453e-6bfb-4d80-98de-b16074f1d86c" name="jetbrains.mps.lang.test" version="2" />
    <use id="f3061a53-9226-4cc5-a443-f952ceaf5816" name="jetbrains.mps.baseLanguage" version="6" />
    <use id="7866978e-a0f0-4cc7-81bc-4d213d9375e1" name="jetbrains.mps.lang.smodel" version="11" />
    <use id="83888646-71ce-4f1c-9c53-c54016f6ad4f" name="jetbrains.mps.baseLanguage.collections" version="0" />
    <use id="fd392034-7849-419d-9071-12563d152375" name="jetbrains.mps.baseLanguage.closures" version="0" />
    <use id="28f9e497-3b42-4291-aeba-0a1039153ab1" name="jetbrains.mps.lang.plugin" version="2" />
    <use id="63650c59-16c8-498a-99c8-005c7ee9515d" name="jetbrains.mps.lang.access" version="0" />
  </languages>
  <imports>
    <import index="f6t6" ref="r:9993217f-5bfa-4281-bc47-527677747cb2(jetbrains.mps.typechecking.sample.bounds)" />
    <import index="tpee" ref="r:00000000-0000-4000-0000-011c895902ca(jetbrains.mps.baseLanguage.structure)" />
    <import index="tj24" ref="r:0fbbb63a-fd15-46e1-8136-78049f6d6e63(jetbrains.mps.typechecking.service)" />
    <import index="mhbf" ref="8865b7a8-5271-43d3-884c-6fd1d9cfdd34/java:org.jetbrains.mps.openapi.model(MPS.OpenAPI/)" implicit="true" />
    <import index="z1c3" ref="6ed54515-acc8-4d1e-a16c-9fd6cfe951ea/java:jetbrains.mps.project(MPS.Core/)" implicit="true" />
    <import index="wyt6" ref="6354ebe7-c22a-4a0f-ac54-50b52ab9b065/java:java.lang(JDK/)" implicit="true" />
  </imports>
  <registry>
    <language id="8585453e-6bfb-4d80-98de-b16074f1d86c" name="jetbrains.mps.lang.test">
      <concept id="5097124989038916362" name="jetbrains.mps.lang.test.structure.TestInfo" flags="ng" index="2XOHcx">
        <property id="5097124989038916363" name="projectPath" index="2XOHcw" />
      </concept>
      <concept id="1225467090849" name="jetbrains.mps.lang.test.structure.ProjectExpression" flags="nn" index="1jxXqW" />
      <concept id="1216913645126" name="jetbrains.mps.lang.test.structure.NodesTestCase" flags="lg" index="1lH9Xt">
        <property id="6339244025081158986" name="needsNoWriteAction" index="3OwPAg" />
        <child id="1217501895093" name="testMethods" index="1SL9yI" />
      </concept>
      <concept id="1225978065297" name="jetbrains.mps.lang.test.structure.SimpleNodeTest" flags="ng" index="1LZb2c" />
    </language>
    <language id="f3061a53-9226-4cc5-a443-f952ceaf5816" name="jetbrains.mps.baseLanguage">
      <concept id="1215693861676" name="jetbrains.mps.baseLanguage.structure.BaseAssignmentExpression" flags="nn" index="d038R">
        <child id="1068498886297" name="rValue" index="37vLTx" />
        <child id="1068498886295" name="lValue" index="37vLTJ" />
      </concept>
      <concept id="1202948039474" name="jetbrains.mps.baseLanguage.structure.InstanceMethodCallOperation" flags="nn" index="liA8E" />
      <concept id="1197027756228" name="jetbrains.mps.baseLanguage.structure.DotExpression" flags="nn" index="2OqwBi">
        <child id="1197027771414" name="operand" index="2Oq$k0" />
        <child id="1197027833540" name="operation" index="2OqNvi" />
      </concept>
      <concept id="1081236700937" name="jetbrains.mps.baseLanguage.structure.StaticMethodCall" flags="nn" index="2YIFZM">
        <reference id="1144433194310" name="classConcept" index="1Pybhc" />
      </concept>
      <concept id="1068498886296" name="jetbrains.mps.baseLanguage.structure.VariableReference" flags="nn" index="37vLTw">
        <reference id="1068581517664" name="variableDeclaration" index="3cqZAo" />
      </concept>
      <concept id="1068498886294" name="jetbrains.mps.baseLanguage.structure.AssignmentExpression" flags="nn" index="37vLTI" />
      <concept id="4972933694980447171" name="jetbrains.mps.baseLanguage.structure.BaseVariableDeclaration" flags="ng" index="19Szcq">
        <child id="5680397130376446158" name="type" index="1tU5fm" />
      </concept>
      <concept id="1068580123132" name="jetbrains.mps.baseLanguage.structure.BaseMethodDeclaration" flags="ng" index="3clF44">
        <child id="1164879685961" name="throwsItem" index="Sfmx6" />
        <child id="1068580123133" name="returnType" index="3clF45" />
        <child id="1068580123135" name="body" index="3clF47" />
      </concept>
      <concept id="1068580123155" name="jetbrains.mps.baseLanguage.structure.ExpressionStatement" flags="nn" index="3clFbF">
        <child id="1068580123156" name="expression" index="3clFbG" />
      </concept>
      <concept id="1068580123136" name="jetbrains.mps.baseLanguage.structure.StatementList" flags="sn" stub="5293379017992965193" index="3clFbS">
        <child id="1068581517665" name="statement" index="3cqZAp" />
      </concept>
      <concept id="1068581242864" name="jetbrains.mps.baseLanguage.structure.LocalVariableDeclarationStatement" flags="nn" index="3cpWs8">
        <child id="1068581242865" name="localVariableDeclaration" index="3cpWs9" />
      </concept>
      <concept id="1068581242863" name="jetbrains.mps.baseLanguage.structure.LocalVariableDeclaration" flags="nr" index="3cpWsn" />
      <concept id="1068581517677" name="jetbrains.mps.baseLanguage.structure.VoidType" flags="in" index="3cqZAl" />
      <concept id="1204053956946" name="jetbrains.mps.baseLanguage.structure.IMethodCall" flags="ng" index="1ndlxa">
        <reference id="1068499141037" name="baseMethodDeclaration" index="37wK5l" />
        <child id="1068499141038" name="actualArgument" index="37wK5m" />
      </concept>
      <concept id="1107535904670" name="jetbrains.mps.baseLanguage.structure.ClassifierType" flags="in" index="3uibUv">
        <reference id="1107535924139" name="classifier" index="3uigEE" />
      </concept>
    </language>
    <language id="63650c59-16c8-498a-99c8-005c7ee9515d" name="jetbrains.mps.lang.access">
      <concept id="8974276187400348173" name="jetbrains.mps.lang.access.structure.CommandClosureLiteral" flags="nn" index="1QHqEC" />
      <concept id="8974276187400348170" name="jetbrains.mps.lang.access.structure.BaseExecuteCommandStatement" flags="nn" index="1QHqEJ">
        <child id="1423104411234567454" name="repo" index="ukAjM" />
        <child id="8974276187400348171" name="commandClosureLiteral" index="1QHqEI" />
      </concept>
      <concept id="8974276187400348181" name="jetbrains.mps.lang.access.structure.ExecuteLightweightCommandStatement" flags="nn" index="1QHqEK" />
    </language>
    <language id="fd392034-7849-419d-9071-12563d152375" name="jetbrains.mps.baseLanguage.closures">
      <concept id="1199569711397" name="jetbrains.mps.baseLanguage.closures.structure.ClosureLiteral" flags="nn" index="1bVj0M">
        <child id="1199569916463" name="body" index="1bW5cS" />
      </concept>
    </language>
    <language id="446c26eb-2b7b-4bf0-9b35-f83fa582753e" name="jetbrains.mps.lang.modelapi">
      <concept id="4733039728785194814" name="jetbrains.mps.lang.modelapi.structure.NamedNodeReference" flags="ng" index="ZC_QK">
        <reference id="7256306938026143658" name="target" index="2aWVGs" />
      </concept>
    </language>
    <language id="f61473f9-130f-42f6-b98d-6c438812c2f6" name="jetbrains.mps.baseLanguage.unitTest">
      <concept id="7080278351417106679" name="jetbrains.mps.baseLanguage.unitTest.structure.AssertIsNotNull" flags="nn" index="2Hmddi">
        <child id="7080278351417106681" name="expression" index="2Hmdds" />
      </concept>
    </language>
    <language id="7866978e-a0f0-4cc7-81bc-4d213d9375e1" name="jetbrains.mps.lang.smodel">
      <concept id="1177026924588" name="jetbrains.mps.lang.smodel.structure.RefConcept_Reference" flags="nn" index="chp4Y">
        <reference id="1177026940964" name="conceptDeclaration" index="cht4Q" />
      </concept>
      <concept id="7400021826774799413" name="jetbrains.mps.lang.smodel.structure.NodePointerExpression" flags="ng" index="2tJFMh">
        <child id="7400021826774799510" name="ref" index="2tJFKM" />
      </concept>
      <concept id="2396822768958367367" name="jetbrains.mps.lang.smodel.structure.AbstractTypeCastExpression" flags="nn" index="$5XWr">
        <child id="6733348108486823193" name="leftExpression" index="1m5AlR" />
        <child id="3906496115198199033" name="conceptArgument" index="3oSUPX" />
      </concept>
      <concept id="1145404486709" name="jetbrains.mps.lang.smodel.structure.SemanticDowncastExpression" flags="nn" index="2JrnkZ">
        <child id="1145404616321" name="leftExpression" index="2JrQYb" />
      </concept>
      <concept id="1140137987495" name="jetbrains.mps.lang.smodel.structure.SNodeTypeCastExpression" flags="nn" index="1PxgMI" />
      <concept id="1138055754698" name="jetbrains.mps.lang.smodel.structure.SNodeType" flags="in" index="3Tqbb2">
        <reference id="1138405853777" name="concept" index="ehGHo" />
      </concept>
    </language>
    <language id="ceab5195-25ea-4f22-9b92-103b95ca8c0c" name="jetbrains.mps.lang.core">
      <concept id="1169194658468" name="jetbrains.mps.lang.core.structure.INamedConcept" flags="ng" index="TrEIO">
        <property id="1169194664001" name="name" index="TrG5h" />
      </concept>
    </language>
  </registry>
  <node concept="1lH9Xt" id="1N_0WA5DT3k">
    <property role="TrG5h" value="Typechecking" />
    <property role="3OwPAg" value="true" />
    <node concept="1LZb2c" id="1N_0WA5DT8G" role="1SL9yI">
      <property role="TrG5h" value="Sample" />
      <node concept="3cqZAl" id="1N_0WA5DT8H" role="3clF45" />
      <node concept="3clFbS" id="1N_0WA5DT8I" role="3clF47">
        <node concept="3cpWs8" id="4BHjwwGJQYe" role="3cqZAp">
          <node concept="3cpWsn" id="4BHjwwGJQYf" role="3cpWs9">
            <property role="TrG5h" value="cls" />
            <node concept="3Tqbb2" id="4BHjwwGJQYb" role="1tU5fm">
              <ref role="ehGHo" to="tpee:g7pOWCK" resolve="Classifier" />
            </node>
          </node>
        </node>
        <node concept="1QHqEK" id="4BHjwwGJZh0" role="3cqZAp">
          <node concept="1QHqEC" id="4BHjwwGJZh2" role="1QHqEI">
            <node concept="3clFbS" id="4BHjwwGJZh4" role="1bW5cS">
              <node concept="3clFbF" id="4BHjwwGP_ld" role="3cqZAp">
                <node concept="37vLTI" id="4BHjwwGP_lf" role="3clFbG">
                  <node concept="1PxgMI" id="4BHjwwGJT1y" role="37vLTx">
                    <node concept="chp4Y" id="4BHjwwGJTcC" role="3oSUPX">
                      <ref role="cht4Q" to="tpee:g7pOWCK" resolve="Classifier" />
                    </node>
                    <node concept="2OqwBi" id="4BHjwwGJRwn" role="1m5AlR">
                      <node concept="2JrnkZ" id="3BqfYtgCQiq" role="2Oq$k0">
                        <node concept="2tJFMh" id="3BqfYtgCQip" role="2JrQYb">
                          <node concept="ZC_QK" id="3BqfYtgCQio" role="2tJFKM">
                            <ref role="2aWVGs" to="f6t6:5s497Vrh6EY" resolve="Sample" />
                          </node>
                        </node>
                      </node>
                      <node concept="liA8E" id="4BHjwwGJRIX" role="2OqNvi">
                        <ref role="37wK5l" to="mhbf:~SNodeReference.resolve(org.jetbrains.mps.openapi.module.SRepository):org.jetbrains.mps.openapi.model.SNode" resolve="resolve" />
                        <node concept="2OqwBi" id="4BHjwwGJS8O" role="37wK5m">
                          <node concept="1jxXqW" id="4BHjwwGJRMu" role="2Oq$k0" />
                          <node concept="liA8E" id="4BHjwwGJSNJ" role="2OqNvi">
                            <ref role="37wK5l" to="z1c3:~Project.getRepository():org.jetbrains.mps.openapi.module.SRepository" resolve="getRepository" />
                          </node>
                        </node>
                      </node>
                    </node>
                  </node>
                  <node concept="37vLTw" id="4BHjwwGP_lj" role="37vLTJ">
                    <ref role="3cqZAo" node="4BHjwwGJQYf" resolve="cls" />
                  </node>
                </node>
              </node>
            </node>
          </node>
          <node concept="2OqwBi" id="4BHjwwGJZO2" role="ukAjM">
            <node concept="1jxXqW" id="4BHjwwGJZt5" role="2Oq$k0" />
            <node concept="liA8E" id="4BHjwwGK0mv" role="2OqNvi">
              <ref role="37wK5l" to="z1c3:~Project.getRepository():org.jetbrains.mps.openapi.module.SRepository" resolve="getRepository" />
            </node>
          </node>
        </node>
        <node concept="2Hmddi" id="4BHjwwGPMah" role="3cqZAp">
          <node concept="2YIFZM" id="4BHjwwGPMdn" role="2Hmdds">
            <ref role="1Pybhc" to="tj24:1N_0WA5JxZO" resolve="TestLaunchTypechecking" />
            <ref role="37wK5l" to="tj24:7y50OW6XU7p" resolve="checkTypes" />
            <node concept="37vLTw" id="4BHjwwGPMdo" role="37wK5m">
              <ref role="3cqZAo" node="4BHjwwGJQYf" resolve="cls" />
            </node>
            <node concept="1jxXqW" id="4BHjwwGPMdp" role="37wK5m" />
          </node>
        </node>
      </node>
      <node concept="3uibUv" id="4BHjwwGP_JJ" role="Sfmx6">
        <ref role="3uigEE" to="wyt6:~Exception" resolve="Exception" />
      </node>
    </node>
    <node concept="1LZb2c" id="1N_0WA5J$AD" role="1SL9yI">
      <property role="TrG5h" value="Sample2" />
      <node concept="3cqZAl" id="1N_0WA5J$AE" role="3clF45" />
      <node concept="3clFbS" id="1N_0WA5J$AF" role="3clF47">
        <node concept="3cpWs8" id="4BHjwwGK10D" role="3cqZAp">
          <node concept="3cpWsn" id="4BHjwwGK10E" role="3cpWs9">
            <property role="TrG5h" value="cls" />
            <node concept="3Tqbb2" id="4BHjwwGK10F" role="1tU5fm">
              <ref role="ehGHo" to="tpee:g7pOWCK" resolve="Classifier" />
            </node>
          </node>
        </node>
        <node concept="1QHqEK" id="4BHjwwGK10A" role="3cqZAp">
          <node concept="1QHqEC" id="4BHjwwGK10B" role="1QHqEI">
            <node concept="3clFbS" id="4BHjwwGK10C" role="1bW5cS">
              <node concept="3clFbF" id="4BHjwwGP_Z5" role="3cqZAp">
                <node concept="37vLTI" id="4BHjwwGP_Z7" role="3clFbG">
                  <node concept="1PxgMI" id="4BHjwwGK10G" role="37vLTx">
                    <node concept="chp4Y" id="4BHjwwGK10H" role="3oSUPX">
                      <ref role="cht4Q" to="tpee:g7pOWCK" resolve="Classifier" />
                    </node>
                    <node concept="2OqwBi" id="4BHjwwGK10I" role="1m5AlR">
                      <node concept="2JrnkZ" id="3BqfYtgCQit" role="2Oq$k0">
                        <node concept="2tJFMh" id="3BqfYtgCQis" role="2JrQYb">
                          <node concept="ZC_QK" id="3BqfYtgCQir" role="2tJFKM">
                            <ref role="2aWVGs" to="f6t6:2U6QFnZujaA" resolve="Sample2" />
                          </node>
                        </node>
                      </node>
                      <node concept="liA8E" id="4BHjwwGK10K" role="2OqNvi">
                        <ref role="37wK5l" to="mhbf:~SNodeReference.resolve(org.jetbrains.mps.openapi.module.SRepository):org.jetbrains.mps.openapi.model.SNode" resolve="resolve" />
                        <node concept="2OqwBi" id="4BHjwwGK10L" role="37wK5m">
                          <node concept="1jxXqW" id="4BHjwwGK10M" role="2Oq$k0" />
                          <node concept="liA8E" id="4BHjwwGK10N" role="2OqNvi">
                            <ref role="37wK5l" to="z1c3:~Project.getRepository():org.jetbrains.mps.openapi.module.SRepository" resolve="getRepository" />
                          </node>
                        </node>
                      </node>
                    </node>
                  </node>
                  <node concept="37vLTw" id="4BHjwwGP_Zb" role="37vLTJ">
                    <ref role="3cqZAo" node="4BHjwwGK10E" resolve="cls" />
                  </node>
                </node>
              </node>
            </node>
          </node>
          <node concept="2OqwBi" id="4BHjwwGK10W" role="ukAjM">
            <node concept="1jxXqW" id="4BHjwwGK10X" role="2Oq$k0" />
            <node concept="liA8E" id="4BHjwwGK10Y" role="2OqNvi">
              <ref role="37wK5l" to="z1c3:~Project.getRepository():org.jetbrains.mps.openapi.module.SRepository" resolve="getRepository" />
            </node>
          </node>
        </node>
        <node concept="2Hmddi" id="4BHjwwGPMus" role="3cqZAp">
          <node concept="2YIFZM" id="4BHjwwGPMut" role="2Hmdds">
            <ref role="37wK5l" to="tj24:7y50OW6XU7p" resolve="checkTypes" />
            <ref role="1Pybhc" to="tj24:1N_0WA5JxZO" resolve="TestLaunchTypechecking" />
            <node concept="37vLTw" id="4BHjwwGPMuu" role="37wK5m">
              <ref role="3cqZAo" node="4BHjwwGK10E" resolve="cls" />
            </node>
            <node concept="1jxXqW" id="4BHjwwGPMuv" role="37wK5m" />
          </node>
        </node>
      </node>
      <node concept="3uibUv" id="4BHjwwGPApQ" role="Sfmx6">
        <ref role="3uigEE" to="wyt6:~Exception" resolve="Exception" />
      </node>
    </node>
    <node concept="1LZb2c" id="5DSQNPPS8E8" role="1SL9yI">
      <property role="TrG5h" value="Variance" />
      <node concept="3cqZAl" id="5DSQNPPS8E9" role="3clF45" />
      <node concept="3clFbS" id="5DSQNPPS8Ea" role="3clF47">
        <node concept="3cpWs8" id="4BHjwwGK2c$" role="3cqZAp">
          <node concept="3cpWsn" id="4BHjwwGK2c_" role="3cpWs9">
            <property role="TrG5h" value="cls" />
            <node concept="3Tqbb2" id="4BHjwwGK2cA" role="1tU5fm">
              <ref role="ehGHo" to="tpee:g7pOWCK" resolve="Classifier" />
            </node>
          </node>
        </node>
        <node concept="1QHqEK" id="4BHjwwGK2cx" role="3cqZAp">
          <node concept="1QHqEC" id="4BHjwwGK2cy" role="1QHqEI">
            <node concept="3clFbS" id="4BHjwwGK2cz" role="1bW5cS">
              <node concept="3clFbF" id="4BHjwwGPACQ" role="3cqZAp">
                <node concept="37vLTI" id="4BHjwwGPACS" role="3clFbG">
                  <node concept="1PxgMI" id="4BHjwwGK2cB" role="37vLTx">
                    <node concept="chp4Y" id="4BHjwwGK2cC" role="3oSUPX">
                      <ref role="cht4Q" to="tpee:g7pOWCK" resolve="Classifier" />
                    </node>
                    <node concept="2OqwBi" id="4BHjwwGK2cD" role="1m5AlR">
                      <node concept="2JrnkZ" id="3BqfYtgCQi5" role="2Oq$k0">
                        <node concept="2tJFMh" id="3BqfYtgCQi4" role="2JrQYb">
                          <node concept="ZC_QK" id="3BqfYtgCQi3" role="2tJFKM">
                            <ref role="2aWVGs" to="f6t6:3yhgKRJ29Qs" resolve="Variance" />
                          </node>
                        </node>
                      </node>
                      <node concept="liA8E" id="4BHjwwGK2cF" role="2OqNvi">
                        <ref role="37wK5l" to="mhbf:~SNodeReference.resolve(org.jetbrains.mps.openapi.module.SRepository):org.jetbrains.mps.openapi.model.SNode" resolve="resolve" />
                        <node concept="2OqwBi" id="4BHjwwGK2cG" role="37wK5m">
                          <node concept="1jxXqW" id="4BHjwwGK2cH" role="2Oq$k0" />
                          <node concept="liA8E" id="4BHjwwGK2cI" role="2OqNvi">
                            <ref role="37wK5l" to="z1c3:~Project.getRepository():org.jetbrains.mps.openapi.module.SRepository" resolve="getRepository" />
                          </node>
                        </node>
                      </node>
                    </node>
                  </node>
                  <node concept="37vLTw" id="4BHjwwGPACW" role="37vLTJ">
                    <ref role="3cqZAo" node="4BHjwwGK2c_" resolve="cls" />
                  </node>
                </node>
              </node>
            </node>
          </node>
          <node concept="2OqwBi" id="4BHjwwGK2cR" role="ukAjM">
            <node concept="1jxXqW" id="4BHjwwGK2cS" role="2Oq$k0" />
            <node concept="liA8E" id="4BHjwwGK2cT" role="2OqNvi">
              <ref role="37wK5l" to="z1c3:~Project.getRepository():org.jetbrains.mps.openapi.module.SRepository" resolve="getRepository" />
            </node>
          </node>
        </node>
        <node concept="2Hmddi" id="4BHjwwGPM_K" role="3cqZAp">
          <node concept="2YIFZM" id="4BHjwwGPM_L" role="2Hmdds">
            <ref role="37wK5l" to="tj24:7y50OW6XU7p" resolve="checkTypes" />
            <ref role="1Pybhc" to="tj24:1N_0WA5JxZO" resolve="TestLaunchTypechecking" />
            <node concept="37vLTw" id="4BHjwwGPM_M" role="37wK5m">
              <ref role="3cqZAo" node="4BHjwwGK2c_" resolve="cls" />
            </node>
            <node concept="1jxXqW" id="4BHjwwGPM_N" role="37wK5m" />
          </node>
        </node>
      </node>
      <node concept="3uibUv" id="4BHjwwGPB3e" role="Sfmx6">
        <ref role="3uigEE" to="wyt6:~Exception" resolve="Exception" />
      </node>
    </node>
    <node concept="1LZb2c" id="19nQ_7V2D9U" role="1SL9yI">
      <property role="TrG5h" value="Recursion" />
      <node concept="3cqZAl" id="19nQ_7V2D9V" role="3clF45" />
      <node concept="3clFbS" id="19nQ_7V2D9W" role="3clF47">
        <node concept="3cpWs8" id="19nQ_7V2D9X" role="3cqZAp">
          <node concept="3cpWsn" id="19nQ_7V2D9Y" role="3cpWs9">
            <property role="TrG5h" value="cls" />
            <node concept="3Tqbb2" id="19nQ_7V2D9Z" role="1tU5fm">
              <ref role="ehGHo" to="tpee:g7pOWCK" resolve="Classifier" />
            </node>
          </node>
        </node>
        <node concept="1QHqEK" id="19nQ_7V2Da0" role="3cqZAp">
          <node concept="1QHqEC" id="19nQ_7V2Da1" role="1QHqEI">
            <node concept="3clFbS" id="19nQ_7V2Da2" role="1bW5cS">
              <node concept="3clFbF" id="19nQ_7V2Da3" role="3cqZAp">
                <node concept="37vLTI" id="19nQ_7V2Da4" role="3clFbG">
                  <node concept="1PxgMI" id="19nQ_7V2Da5" role="37vLTx">
                    <node concept="chp4Y" id="19nQ_7V2Da6" role="3oSUPX">
                      <ref role="cht4Q" to="tpee:g7pOWCK" resolve="Classifier" />
                    </node>
                    <node concept="2OqwBi" id="19nQ_7V2Da7" role="1m5AlR">
                      <node concept="2JrnkZ" id="3BqfYtgCQi2" role="2Oq$k0">
                        <node concept="2tJFMh" id="3BqfYtgCQi1" role="2JrQYb">
                          <node concept="ZC_QK" id="3BqfYtgCQi0" role="2tJFKM">
                            <ref role="2aWVGs" to="f6t6:7w387SKGv4P" resolve="Recursion" />
                          </node>
                        </node>
                      </node>
                      <node concept="liA8E" id="19nQ_7V2Da9" role="2OqNvi">
                        <ref role="37wK5l" to="mhbf:~SNodeReference.resolve(org.jetbrains.mps.openapi.module.SRepository):org.jetbrains.mps.openapi.model.SNode" resolve="resolve" />
                        <node concept="2OqwBi" id="19nQ_7V2Daa" role="37wK5m">
                          <node concept="1jxXqW" id="19nQ_7V2Dab" role="2Oq$k0" />
                          <node concept="liA8E" id="19nQ_7V2Dac" role="2OqNvi">
                            <ref role="37wK5l" to="z1c3:~Project.getRepository():org.jetbrains.mps.openapi.module.SRepository" resolve="getRepository" />
                          </node>
                        </node>
                      </node>
                    </node>
                  </node>
                  <node concept="37vLTw" id="19nQ_7V2Dad" role="37vLTJ">
                    <ref role="3cqZAo" node="19nQ_7V2D9Y" resolve="cls" />
                  </node>
                </node>
              </node>
            </node>
          </node>
          <node concept="2OqwBi" id="19nQ_7V2Dae" role="ukAjM">
            <node concept="1jxXqW" id="19nQ_7V2Daf" role="2Oq$k0" />
            <node concept="liA8E" id="19nQ_7V2Dag" role="2OqNvi">
              <ref role="37wK5l" to="z1c3:~Project.getRepository():org.jetbrains.mps.openapi.module.SRepository" resolve="getRepository" />
            </node>
          </node>
        </node>
        <node concept="2Hmddi" id="19nQ_7V2Dah" role="3cqZAp">
          <node concept="2YIFZM" id="19nQ_7V2Dai" role="2Hmdds">
            <ref role="37wK5l" to="tj24:7y50OW6XU7p" resolve="checkTypes" />
            <ref role="1Pybhc" to="tj24:1N_0WA5JxZO" resolve="TestLaunchTypechecking" />
            <node concept="37vLTw" id="19nQ_7V2Daj" role="37wK5m">
              <ref role="3cqZAo" node="19nQ_7V2D9Y" resolve="cls" />
            </node>
            <node concept="1jxXqW" id="19nQ_7V2Dak" role="37wK5m" />
          </node>
        </node>
      </node>
      <node concept="3uibUv" id="19nQ_7V2Dal" role="Sfmx6">
        <ref role="3uigEE" to="wyt6:~Exception" resolve="Exception" />
      </node>
    </node>
  </node>
  <node concept="2XOHcx" id="1N_0WA5DT60">
    <property role="2XOHcw" value="${logic_home}" />
  </node>
</model>

