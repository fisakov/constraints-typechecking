<?xml version="1.0" encoding="UTF-8"?>
<model ref="r:cbfbe9a2-941f-4667-8e48-3bf39c5dad6d(jetbrains.mps.typechecking@tests)">
  <persistence version="9" />
  <languages>
    <use id="8585453e-6bfb-4d80-98de-b16074f1d86c" name="jetbrains.mps.lang.test" version="1" />
    <use id="f61473f9-130f-42f6-b98d-6c438812c2f6" name="jetbrains.mps.baseLanguage.unitTest" version="0" />
    <use id="f3061a53-9226-4cc5-a443-f952ceaf5816" name="jetbrains.mps.baseLanguage" version="5" />
    <use id="7866978e-a0f0-4cc7-81bc-4d213d9375e1" name="jetbrains.mps.lang.smodel" version="8" />
    <use id="fd392034-7849-419d-9071-12563d152375" name="jetbrains.mps.baseLanguage.closures" version="0" />
    <use id="3a13115c-633c-4c5c-bbcc-75c4219e9555" name="jetbrains.mps.lang.quotation" version="0" />
    <use id="cba985fe-1e96-4f16-9f8d-b07434405d4f" name="jetbrains.mps.lang.smodel.types" version="0" />
    <use id="0fda14cc-a416-4c81-869a-2175d8b3325d" name="jetbrains.mps.baseLanguageExt" version="0" />
    <use id="443f4c36-fcf5-4eb6-9500-8d06ed259e3e" name="jetbrains.mps.baseLanguage.classifiers" version="0" />
    <use id="83888646-71ce-4f1c-9c53-c54016f6ad4f" name="jetbrains.mps.baseLanguage.collections" version="0" />
  </languages>
  <imports>
    <import index="wyt6" ref="6354ebe7-c22a-4a0f-ac54-50b52ab9b065/java:java.lang(JDK/)" />
    <import index="z1c3" ref="6ed54515-acc8-4d1e-a16c-9fd6cfe951ea/java:jetbrains.mps.project(MPS.Core/)" />
    <import index="hano" ref="r:2b43b673-12f9-49ea-8e43-d0c7a401586a(jetbrains.mps.lang.typesystem2.typechecking)" />
    <import index="tpee" ref="r:00000000-0000-4000-0000-011c895902ca(jetbrains.mps.baseLanguage.structure)" />
    <import index="umch" ref="r:4caa22a9-5195-4617-8800-5f9f74cc4480(jetbrains.mps.lang.typesystem2.helper.plugin)" />
    <import index="mhbf" ref="8865b7a8-5271-43d3-884c-6fd1d9cfdd34/java:org.jetbrains.mps.openapi.model(MPS.OpenAPI/)" />
    <import index="lui2" ref="8865b7a8-5271-43d3-884c-6fd1d9cfdd34/java:org.jetbrains.mps.openapi.module(MPS.OpenAPI/)" />
    <import index="w7la" ref="bbf5c548-7111-4a53-a117-cdefc664cf34/java:jetbrains.mps.logic.reactor.evaluation(jetbrains.mps.logic.reactor/)" />
    <import index="cxk7" ref="r:daa544a7-0a5c-49c0-a54c-4c2a5b4868aa(jetbrains.mps.logic.builtin.predicate)" />
    <import index="yg8f" ref="r:e213377a-f1a7-4ba7-9d08-96bcb97ed8ce(jetbrains.mps.logic.builtin)" />
    <import index="zx3l" ref="bbf5c548-7111-4a53-a117-cdefc664cf34/java:jetbrains.mps.logic.reactor.core(jetbrains.mps.logic.reactor/)" />
    <import index="dush" ref="8865b7a8-5271-43d3-884c-6fd1d9cfdd34/java:org.jetbrains.mps.openapi.persistence(MPS.OpenAPI/)" />
    <import index="pa15" ref="6ed54515-acc8-4d1e-a16c-9fd6cfe951ea/java:jetbrains.mps.persistence(MPS.Core/)" />
    <import index="33ny" ref="6354ebe7-c22a-4a0f-ac54-50b52ab9b065/java:java.util(JDK/)" />
    <import index="guwi" ref="6354ebe7-c22a-4a0f-ac54-50b52ab9b065/java:java.io(JDK/)" />
    <import index="av0y" ref="bbf5c548-7111-4a53-a117-cdefc664cf34/java:jetbrains.mps.logic.reactor.program(jetbrains.mps.logic.reactor/)" />
    <import index="fqlx" ref="r:2cc226a9-8a78-4010-b962-823343fd28ff(jetbrains.mps.lang.typesystem2.aspect)" />
    <import index="t5kh" ref="r:1514c681-0724-461e-a435-315a6af4b3b4(jetbrains.mps.typechecking.plugin)" />
    <import index="tqvn" ref="6ed54515-acc8-4d1e-a16c-9fd6cfe951ea/java:jetbrains.mps.smodel.tempmodel(MPS.Core/)" />
    <import index="6exd" ref="r:0f9b1fb3-00f9-4480-b235-1a906a087ab2(jetbrains.mps.logic.treeform)" />
    <import index="c17a" ref="8865b7a8-5271-43d3-884c-6fd1d9cfdd34/java:org.jetbrains.mps.openapi.language(MPS.OpenAPI/)" />
    <import index="w1kc" ref="6ed54515-acc8-4d1e-a16c-9fd6cfe951ea/java:jetbrains.mps.smodel(MPS.Core/)" />
  </imports>
  <registry>
    <language id="8585453e-6bfb-4d80-98de-b16074f1d86c" name="jetbrains.mps.lang.test">
      <concept id="5097124989038916362" name="jetbrains.mps.lang.test.structure.TestInfo" flags="ng" index="2XOHcx">
        <property id="5097124989038916363" name="projectPath" index="2XOHcw" />
      </concept>
      <concept id="1225467090849" name="jetbrains.mps.lang.test.structure.ProjectExpression" flags="nn" index="1jxXqW" />
      <concept id="1216913645126" name="jetbrains.mps.lang.test.structure.NodesTestCase" flags="lg" index="1lH9Xt">
        <child id="1216993439383" name="methods" index="1qtyYc" />
        <child id="1217501822150" name="nodesToCheck" index="1SKRRt" />
        <child id="1217501895093" name="testMethods" index="1SL9yI" />
      </concept>
      <concept id="1216989428737" name="jetbrains.mps.lang.test.structure.TestNode" flags="ng" index="1qefOq">
        <child id="1216989461394" name="nodeToCheck" index="1qenE9" />
      </concept>
      <concept id="1210673684636" name="jetbrains.mps.lang.test.structure.TestNodeAnnotation" flags="ng" index="3xLA65" />
      <concept id="1210674524691" name="jetbrains.mps.lang.test.structure.TestNodeReference" flags="nn" index="3xONca">
        <reference id="1210674534086" name="declaration" index="3xOPvv" />
      </concept>
      <concept id="1225978065297" name="jetbrains.mps.lang.test.structure.SimpleNodeTest" flags="ng" index="1LZb2c" />
    </language>
    <language id="f3061a53-9226-4cc5-a443-f952ceaf5816" name="jetbrains.mps.baseLanguage">
      <concept id="1215693861676" name="jetbrains.mps.baseLanguage.structure.BaseAssignmentExpression" flags="nn" index="d038R">
        <child id="1068498886297" name="rValue" index="37vLTx" />
        <child id="1068498886295" name="lValue" index="37vLTJ" />
      </concept>
      <concept id="1202948039474" name="jetbrains.mps.baseLanguage.structure.InstanceMethodCallOperation" flags="nn" index="liA8E" />
      <concept id="1465982738277781862" name="jetbrains.mps.baseLanguage.structure.PlaceholderMember" flags="ng" index="2tJIrI" />
      <concept id="1153952380246" name="jetbrains.mps.baseLanguage.structure.TryStatement" flags="nn" index="2GUZhq">
        <child id="1153952416686" name="body" index="2GV8ay" />
        <child id="1153952429843" name="finallyBody" index="2GVbov" />
      </concept>
      <concept id="1154032098014" name="jetbrains.mps.baseLanguage.structure.AbstractLoopStatement" flags="nn" index="2LF5Ji">
        <child id="1154032183016" name="body" index="2LFqv$" />
      </concept>
      <concept id="1197027756228" name="jetbrains.mps.baseLanguage.structure.DotExpression" flags="nn" index="2OqwBi">
        <child id="1197027771414" name="operand" index="2Oq$k0" />
        <child id="1197027833540" name="operation" index="2OqNvi" />
      </concept>
      <concept id="1145552977093" name="jetbrains.mps.baseLanguage.structure.GenericNewExpression" flags="nn" index="2ShNRf">
        <child id="1145553007750" name="creator" index="2ShVmc" />
      </concept>
      <concept id="1070475926800" name="jetbrains.mps.baseLanguage.structure.StringLiteral" flags="nn" index="Xl_RD">
        <property id="1070475926801" name="value" index="Xl_RC" />
      </concept>
      <concept id="1081236700937" name="jetbrains.mps.baseLanguage.structure.StaticMethodCall" flags="nn" index="2YIFZM">
        <reference id="1144433194310" name="classConcept" index="1Pybhc" />
      </concept>
      <concept id="1070533707846" name="jetbrains.mps.baseLanguage.structure.StaticFieldReference" flags="nn" index="10M0yZ">
        <reference id="1144433057691" name="classifier" index="1PxDUh" />
      </concept>
      <concept id="1070534058343" name="jetbrains.mps.baseLanguage.structure.NullLiteral" flags="nn" index="10Nm6u" />
      <concept id="1068390468200" name="jetbrains.mps.baseLanguage.structure.FieldDeclaration" flags="ig" index="312cEg" />
      <concept id="1068390468198" name="jetbrains.mps.baseLanguage.structure.ClassConcept" flags="ig" index="312cEu" />
      <concept id="1068431474542" name="jetbrains.mps.baseLanguage.structure.VariableDeclaration" flags="ng" index="33uBYm">
        <child id="1068431790190" name="initializer" index="33vP2m" />
      </concept>
      <concept id="1109279763828" name="jetbrains.mps.baseLanguage.structure.TypeVariableDeclaration" flags="ng" index="16euLQ" />
      <concept id="1109279851642" name="jetbrains.mps.baseLanguage.structure.GenericDeclaration" flags="ng" index="16eOlS">
        <child id="1109279881614" name="typeVariableDeclaration" index="16eVyc" />
      </concept>
      <concept id="1068498886296" name="jetbrains.mps.baseLanguage.structure.VariableReference" flags="nn" index="37vLTw">
        <reference id="1068581517664" name="variableDeclaration" index="3cqZAo" />
      </concept>
      <concept id="1068498886292" name="jetbrains.mps.baseLanguage.structure.ParameterDeclaration" flags="ir" index="37vLTG" />
      <concept id="1068498886294" name="jetbrains.mps.baseLanguage.structure.AssignmentExpression" flags="nn" index="37vLTI" />
      <concept id="4972933694980447171" name="jetbrains.mps.baseLanguage.structure.BaseVariableDeclaration" flags="ng" index="19Szcq">
        <child id="5680397130376446158" name="type" index="1tU5fm" />
      </concept>
      <concept id="1068580123132" name="jetbrains.mps.baseLanguage.structure.BaseMethodDeclaration" flags="ng" index="3clF44">
        <child id="1164879685961" name="throwsItem" index="Sfmx6" />
        <child id="1068580123133" name="returnType" index="3clF45" />
        <child id="1068580123134" name="parameter" index="3clF46" />
        <child id="1068580123135" name="body" index="3clF47" />
      </concept>
      <concept id="1068580123165" name="jetbrains.mps.baseLanguage.structure.InstanceMethodDeclaration" flags="ig" index="3clFb_" />
      <concept id="1068580123155" name="jetbrains.mps.baseLanguage.structure.ExpressionStatement" flags="nn" index="3clFbF">
        <child id="1068580123156" name="expression" index="3clFbG" />
      </concept>
      <concept id="1068580123157" name="jetbrains.mps.baseLanguage.structure.Statement" flags="nn" index="3clFbH" />
      <concept id="1068580123159" name="jetbrains.mps.baseLanguage.structure.IfStatement" flags="nn" index="3clFbJ">
        <child id="1068580123160" name="condition" index="3clFbw" />
        <child id="1068580123161" name="ifTrue" index="3clFbx" />
      </concept>
      <concept id="1068580123136" name="jetbrains.mps.baseLanguage.structure.StatementList" flags="sn" stub="5293379017992965193" index="3clFbS">
        <child id="1068581517665" name="statement" index="3cqZAp" />
      </concept>
      <concept id="1068580123137" name="jetbrains.mps.baseLanguage.structure.BooleanConstant" flags="nn" index="3clFbT">
        <property id="1068580123138" name="value" index="3clFbU" />
      </concept>
      <concept id="1068580320020" name="jetbrains.mps.baseLanguage.structure.IntegerConstant" flags="nn" index="3cmrfG">
        <property id="1068580320021" name="value" index="3cmrfH" />
      </concept>
      <concept id="1068581242878" name="jetbrains.mps.baseLanguage.structure.ReturnStatement" flags="nn" index="3cpWs6">
        <child id="1068581517676" name="expression" index="3cqZAk" />
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
      <concept id="1212685548494" name="jetbrains.mps.baseLanguage.structure.ClassCreator" flags="nn" index="1pGfFk" />
      <concept id="1107461130800" name="jetbrains.mps.baseLanguage.structure.Classifier" flags="ng" index="3pOWGL">
        <property id="521412098689998745" name="nonStatic" index="2bfB8j" />
        <child id="5375687026011219971" name="member" index="jymVt" unordered="true" />
      </concept>
      <concept id="7812454656619025412" name="jetbrains.mps.baseLanguage.structure.LocalMethodCall" flags="nn" index="1rXfSq" />
      <concept id="1107535904670" name="jetbrains.mps.baseLanguage.structure.ClassifierType" flags="in" index="3uibUv">
        <reference id="1107535924139" name="classifier" index="3uigEE" />
        <child id="1109201940907" name="parameter" index="11_B2D" />
      </concept>
      <concept id="1081773326031" name="jetbrains.mps.baseLanguage.structure.BinaryOperation" flags="nn" index="3uHJSO">
        <child id="1081773367579" name="rightExpression" index="3uHU7w" />
        <child id="1081773367580" name="leftExpression" index="3uHU7B" />
      </concept>
      <concept id="1073239437375" name="jetbrains.mps.baseLanguage.structure.NotEqualsExpression" flags="nn" index="3y3z36" />
      <concept id="1081855346303" name="jetbrains.mps.baseLanguage.structure.BreakStatement" flags="nn" index="3zACq4" />
      <concept id="1178549954367" name="jetbrains.mps.baseLanguage.structure.IVisible" flags="ng" index="1B3ioH">
        <child id="1178549979242" name="visibility" index="1B3o_S" />
      </concept>
      <concept id="1144226303539" name="jetbrains.mps.baseLanguage.structure.ForeachStatement" flags="nn" index="1DcWWT">
        <child id="1144226360166" name="iterable" index="1DdaDG" />
      </concept>
      <concept id="1144230876926" name="jetbrains.mps.baseLanguage.structure.AbstractForStatement" flags="nn" index="1DupvO">
        <child id="1144230900587" name="variable" index="1Duv9x" />
      </concept>
      <concept id="1107796713796" name="jetbrains.mps.baseLanguage.structure.Interface" flags="ig" index="3HP615" />
      <concept id="6329021646629104957" name="jetbrains.mps.baseLanguage.structure.TextCommentPart" flags="nn" index="3SKdUq">
        <property id="6329021646629104958" name="text" index="3SKdUp" />
      </concept>
      <concept id="6329021646629104954" name="jetbrains.mps.baseLanguage.structure.SingleLineComment" flags="nn" index="3SKdUt">
        <child id="6329021646629175155" name="commentPart" index="3SKWNk" />
      </concept>
      <concept id="1146644602865" name="jetbrains.mps.baseLanguage.structure.PublicVisibility" flags="nn" index="3Tm1VV" />
      <concept id="1146644623116" name="jetbrains.mps.baseLanguage.structure.PrivateVisibility" flags="nn" index="3Tm6S6" />
    </language>
    <language id="fd392034-7849-419d-9071-12563d152375" name="jetbrains.mps.baseLanguage.closures">
      <concept id="1199569711397" name="jetbrains.mps.baseLanguage.closures.structure.ClosureLiteral" flags="nn" index="1bVj0M">
        <child id="1199569906740" name="parameter" index="1bW2Oz" />
        <child id="1199569916463" name="body" index="1bW5cS" />
      </concept>
    </language>
    <language id="443f4c36-fcf5-4eb6-9500-8d06ed259e3e" name="jetbrains.mps.baseLanguage.classifiers">
      <concept id="1205752633985" name="jetbrains.mps.baseLanguage.classifiers.structure.ThisClassifierExpression" flags="nn" index="2WthIp" />
      <concept id="1205756064662" name="jetbrains.mps.baseLanguage.classifiers.structure.IMemberOperation" flags="ng" index="2WEnae">
        <reference id="1205756909548" name="member" index="2WH_rO" />
      </concept>
      <concept id="1205769003971" name="jetbrains.mps.baseLanguage.classifiers.structure.DefaultClassifierMethodDeclaration" flags="ng" index="2XrIbr" />
      <concept id="1205769149993" name="jetbrains.mps.baseLanguage.classifiers.structure.DefaultClassifierMethodCallOperation" flags="nn" index="2XshWL">
        <child id="1205770614681" name="actualArgument" index="2XxRq1" />
      </concept>
    </language>
    <language id="3a13115c-633c-4c5c-bbcc-75c4219e9555" name="jetbrains.mps.lang.quotation">
      <concept id="1196350785110" name="jetbrains.mps.lang.quotation.structure.AbstractAntiquotation" flags="ng" index="2c44t0">
        <property id="6489343236075007666" name="label" index="3hQQBS" />
        <child id="1196350785111" name="expression" index="2c44t1" />
      </concept>
      <concept id="1196350785117" name="jetbrains.mps.lang.quotation.structure.ReferenceAntiquotation" flags="ng" index="2c44tb" />
      <concept id="1196350785113" name="jetbrains.mps.lang.quotation.structure.Quotation" flags="nn" index="2c44tf">
        <child id="1196350785114" name="quotedNode" index="2c44tc" />
      </concept>
    </language>
    <language id="f61473f9-130f-42f6-b98d-6c438812c2f6" name="jetbrains.mps.baseLanguage.unitTest">
      <concept id="7080278351417106679" name="jetbrains.mps.baseLanguage.unitTest.structure.AssertIsNotNull" flags="nn" index="2Hmddi">
        <child id="7080278351417106681" name="expression" index="2Hmdds" />
      </concept>
      <concept id="8427750732757990717" name="jetbrains.mps.baseLanguage.unitTest.structure.BinaryAssert" flags="nn" index="3tpDYu">
        <child id="8427750732757990725" name="actual" index="3tpDZA" />
        <child id="8427750732757990724" name="expected" index="3tpDZB" />
      </concept>
      <concept id="1171981022339" name="jetbrains.mps.baseLanguage.unitTest.structure.AssertTrue" flags="nn" index="3vwNmj">
        <child id="1171981057159" name="condition" index="3vwVQn" />
      </concept>
      <concept id="1171985735491" name="jetbrains.mps.baseLanguage.unitTest.structure.AssertSame" flags="nn" index="3vMLTj" />
      <concept id="1172028177041" name="jetbrains.mps.baseLanguage.unitTest.structure.AssertIsNull" flags="nn" index="3ykFI1">
        <child id="1172028236559" name="expression" index="3ykU8v" />
      </concept>
    </language>
    <language id="7866978e-a0f0-4cc7-81bc-4d213d9375e1" name="jetbrains.mps.lang.smodel">
      <concept id="1143226024141" name="jetbrains.mps.lang.smodel.structure.SModelType" flags="in" index="H_c77" />
      <concept id="1143234257716" name="jetbrains.mps.lang.smodel.structure.Node_GetModelOperation" flags="nn" index="I4A8Y" />
      <concept id="1145404486709" name="jetbrains.mps.lang.smodel.structure.SemanticDowncastExpression" flags="nn" index="2JrnkZ">
        <child id="1145404616321" name="leftExpression" index="2JrQYb" />
      </concept>
      <concept id="1171310072040" name="jetbrains.mps.lang.smodel.structure.Node_GetContainingRootOperation" flags="nn" index="2Rxl7S" />
      <concept id="1227264722563" name="jetbrains.mps.lang.smodel.structure.EqualsStructurallyExpression" flags="nn" index="2YFouu" />
      <concept id="1180636770613" name="jetbrains.mps.lang.smodel.structure.SNodeCreator" flags="nn" index="3zrR0B">
        <child id="1180636770616" name="createdType" index="3zrR0E" />
      </concept>
      <concept id="1206482823744" name="jetbrains.mps.lang.smodel.structure.Model_AddRootOperation" flags="nn" index="3BYIHo">
        <child id="1206482823746" name="nodeArgument" index="3BYIHq" />
      </concept>
      <concept id="1138055754698" name="jetbrains.mps.lang.smodel.structure.SNodeType" flags="in" index="3Tqbb2">
        <reference id="1138405853777" name="concept" index="ehGHo" />
      </concept>
      <concept id="1138056143562" name="jetbrains.mps.lang.smodel.structure.SLinkAccess" flags="nn" index="3TrEf2">
        <reference id="1138056516764" name="link" index="3Tt5mk" />
      </concept>
    </language>
    <language id="ceab5195-25ea-4f22-9b92-103b95ca8c0c" name="jetbrains.mps.lang.core">
      <concept id="1133920641626" name="jetbrains.mps.lang.core.structure.BaseConcept" flags="ng" index="2VYdi">
        <child id="5169995583184591170" name="smodelAttribute" index="lGtFl" />
      </concept>
      <concept id="3364660638048049745" name="jetbrains.mps.lang.core.structure.LinkAttribute" flags="ng" index="A9Btn">
        <property id="1757699476691236116" name="linkRole" index="2qtEX8" />
        <property id="1341860900488019036" name="linkId" index="P3scX" />
      </concept>
      <concept id="1169194658468" name="jetbrains.mps.lang.core.structure.INamedConcept" flags="ng" index="TrEIO">
        <property id="1169194664001" name="name" index="TrG5h" />
      </concept>
    </language>
    <language id="83888646-71ce-4f1c-9c53-c54016f6ad4f" name="jetbrains.mps.baseLanguage.collections">
      <concept id="1162935959151" name="jetbrains.mps.baseLanguage.collections.structure.GetSizeOperation" flags="nn" index="34oBXx" />
    </language>
    <language id="cba985fe-1e96-4f16-9f8d-b07434405d4f" name="jetbrains.mps.lang.smodel.types">
      <concept id="7345257067587627589" name="jetbrains.mps.lang.smodel.types.structure.SNodeTypeOperation" flags="ng" index="2W$R8B" />
    </language>
  </registry>
  <node concept="2XOHcx" id="7t5VLKGQVAO">
    <property role="2XOHcw" value="${logic_home}" />
  </node>
  <node concept="1lH9Xt" id="6QH_LDtdSk3">
    <property role="TrG5h" value="TypeCache" />
    <node concept="1qefOq" id="6QH_LDtdTZR" role="1SKRRt">
      <node concept="312cEu" id="6QH_LDtdTZT" role="1qenE9">
        <property role="TrG5h" value="Foo" />
        <node concept="3Tm1VV" id="6QH_LDtdTZU" role="1B3o_S" />
        <node concept="3xLA65" id="6QH_LDtdU18" role="lGtFl">
          <property role="TrG5h" value="foo" />
        </node>
      </node>
    </node>
    <node concept="1LZb2c" id="6QH_LDtdSlj" role="1SL9yI">
      <property role="TrG5h" value="typeInitCache" />
      <node concept="3cqZAl" id="6QH_LDtdSlk" role="3clF45" />
      <node concept="3clFbS" id="6QH_LDtdSlo" role="3clF47">
        <node concept="3cpWs8" id="6QH_LDtdVp3" role="3cqZAp">
          <node concept="3cpWsn" id="6QH_LDtdVp4" role="3cpWs9">
            <property role="TrG5h" value="unit" />
            <node concept="H_c77" id="6QH_LDtdVp0" role="1tU5fm" />
            <node concept="2OqwBi" id="6QH_LDtdVp5" role="33vP2m">
              <node concept="3xONca" id="6QH_LDtdVp6" role="2Oq$k0">
                <ref role="3xOPvv" node="6QH_LDtdU18" resolve="foo" />
              </node>
              <node concept="I4A8Y" id="6QH_LDtdVp7" role="2OqNvi" />
            </node>
          </node>
        </node>
        <node concept="3clFbH" id="6QH_LDtdVFg" role="3cqZAp" />
        <node concept="3cpWs8" id="6QH_LDtdTgr" role="3cqZAp">
          <node concept="3cpWsn" id="6QH_LDtdTgs" role="3cpWs9">
            <property role="TrG5h" value="tc" />
            <node concept="3uibUv" id="6QH_LDtdTgp" role="1tU5fm">
              <ref role="3uigEE" to="hano:4Z$O9mrQIzY" resolve="Typechecking" />
            </node>
            <node concept="2YIFZM" id="6QH_LDtdTgt" role="33vP2m">
              <ref role="37wK5l" to="hano:4Z$O9mrQIG1" resolve="get" />
              <ref role="1Pybhc" to="hano:4Z$O9mrQIzY" resolve="Typechecking" />
              <node concept="2OqwBi" id="6QH_LDtdTwK" role="37wK5m">
                <node concept="1jxXqW" id="6QH_LDtdTWQ" role="2Oq$k0" />
                <node concept="liA8E" id="6QH_LDtdTVP" role="2OqNvi">
                  <ref role="37wK5l" to="z1c3:~Project.getRepository():org.jetbrains.mps.openapi.module.SRepository" resolve="getRepository" />
                </node>
              </node>
            </node>
          </node>
        </node>
        <node concept="3cpWs8" id="6QH_LDtdVHj" role="3cqZAp">
          <node concept="3cpWsn" id="6QH_LDtdVHk" role="3cpWs9">
            <property role="TrG5h" value="typesCache" />
            <node concept="3uibUv" id="6QH_LDtfmIh" role="1tU5fm">
              <ref role="3uigEE" to="hano:6QH_LDtfe19" resolve="Typechecking.TypeCache" />
            </node>
            <node concept="2OqwBi" id="6QH_LDtdVHl" role="33vP2m">
              <node concept="37vLTw" id="6QH_LDtdVHm" role="2Oq$k0">
                <ref role="3cqZAo" node="6QH_LDtdTgs" resolve="tc" />
              </node>
              <node concept="liA8E" id="6QH_LDtdVHn" role="2OqNvi">
                <ref role="37wK5l" to="hano:4Z$O9mrQJgp" resolve="cachedTypes" />
                <node concept="37vLTw" id="6QH_LDtdVHo" role="37wK5m">
                  <ref role="3cqZAo" node="6QH_LDtdVp4" resolve="unit" />
                </node>
              </node>
            </node>
          </node>
        </node>
        <node concept="3ykFI1" id="6QH_LDtdYpJ" role="3cqZAp">
          <node concept="37vLTw" id="6QH_LDtdYsF" role="3ykU8v">
            <ref role="3cqZAo" node="6QH_LDtdVHk" resolve="typesCache" />
          </node>
        </node>
        <node concept="3clFbH" id="6QH_LDtdSlO" role="3cqZAp" />
        <node concept="3cpWs8" id="6QH_LDtdXLJ" role="3cqZAp">
          <node concept="3cpWsn" id="6QH_LDtdXLK" role="3cpWs9">
            <property role="TrG5h" value="typeCache2" />
            <node concept="3uibUv" id="6QH_LDtfmAJ" role="1tU5fm">
              <ref role="3uigEE" to="hano:6QH_LDtfe19" resolve="Typechecking.TypeCache" />
            </node>
            <node concept="2OqwBi" id="6QH_LDtdXLL" role="33vP2m">
              <node concept="37vLTw" id="6QH_LDtdXLM" role="2Oq$k0">
                <ref role="3cqZAo" node="6QH_LDtdTgs" resolve="tc" />
              </node>
              <node concept="liA8E" id="6QH_LDtdXLN" role="2OqNvi">
                <ref role="37wK5l" to="hano:6QH_LDtbsGz" resolve="updateCachedTypes" />
                <node concept="37vLTw" id="6QH_LDtdXLO" role="37wK5m">
                  <ref role="3cqZAo" node="6QH_LDtdVp4" resolve="unit" />
                </node>
                <node concept="1bVj0M" id="6QH_LDtdXLP" role="37wK5m">
                  <node concept="3clFbS" id="6QH_LDtdXLQ" role="1bW5cS">
                    <node concept="3clFbH" id="6QH_LDtet4b" role="3cqZAp" />
                    <node concept="3cpWs8" id="6QH_LDteuBg" role="3cqZAp">
                      <node concept="3cpWsn" id="6QH_LDteuBh" role="3cpWs9">
                        <property role="TrG5h" value="typesModel" />
                        <node concept="H_c77" id="6QH_LDteuBc" role="1tU5fm" />
                        <node concept="2OqwBi" id="6QH_LDteuBi" role="33vP2m">
                          <node concept="37vLTw" id="6QH_LDteuBj" role="2Oq$k0">
                            <ref role="3cqZAo" node="6QH_LDtdXLR" resolve="typeCache" />
                          </node>
                          <node concept="liA8E" id="6QH_LDteuBk" role="2OqNvi">
                            <ref role="37wK5l" to="hano:6QH_LDtcxgx" resolve="typesModel" />
                          </node>
                        </node>
                      </node>
                    </node>
                    <node concept="3cpWs8" id="6QH_LDtewyr" role="3cqZAp">
                      <node concept="3cpWsn" id="6QH_LDtewys" role="3cpWs9">
                        <property role="TrG5h" value="clsType" />
                        <node concept="3Tqbb2" id="6QH_LDtewyh" role="1tU5fm">
                          <ref role="ehGHo" to="tpee:g7uibYu" resolve="ClassifierType" />
                        </node>
                        <node concept="2OqwBi" id="6QH_LDtewyt" role="33vP2m">
                          <node concept="37vLTw" id="6QH_LDtewyu" role="2Oq$k0">
                            <ref role="3cqZAo" node="6QH_LDteuBh" resolve="typesModel" />
                          </node>
                          <node concept="3BYIHo" id="6QH_LDtewyv" role="2OqNvi">
                            <node concept="2ShNRf" id="6QH_LDtewyw" role="3BYIHq">
                              <node concept="3zrR0B" id="6QH_LDtewyx" role="2ShVmc">
                                <node concept="3Tqbb2" id="6QH_LDtewyy" role="3zrR0E">
                                  <ref role="ehGHo" to="tpee:g7uibYu" resolve="ClassifierType" />
                                </node>
                              </node>
                            </node>
                          </node>
                        </node>
                      </node>
                    </node>
                    <node concept="3clFbF" id="6QH_LDtetXP" role="3cqZAp">
                      <node concept="37vLTI" id="6QH_LDteyw3" role="3clFbG">
                        <node concept="3xONca" id="6QH_LDteyD6" role="37vLTx">
                          <ref role="3xOPvv" node="6QH_LDtdU18" resolve="foo" />
                        </node>
                        <node concept="2OqwBi" id="6QH_LDtewUA" role="37vLTJ">
                          <node concept="37vLTw" id="6QH_LDtewyz" role="2Oq$k0">
                            <ref role="3cqZAo" node="6QH_LDtewys" resolve="clsType" />
                          </node>
                          <node concept="3TrEf2" id="6QH_LDtexF8" role="2OqNvi">
                            <ref role="3Tt5mk" to="tpee:g7uigIF" resolve="classifier" />
                          </node>
                        </node>
                      </node>
                    </node>
                    <node concept="3clFbH" id="6QH_LDtetG2" role="3cqZAp" />
                    <node concept="3clFbF" id="6QH_LDtesyR" role="3cqZAp">
                      <node concept="2OqwBi" id="6QH_LDtesDH" role="3clFbG">
                        <node concept="37vLTw" id="6QH_LDtesyP" role="2Oq$k0">
                          <ref role="3cqZAo" node="6QH_LDtdXLR" resolve="typeCache" />
                        </node>
                        <node concept="liA8E" id="6QH_LDtesSt" role="2OqNvi">
                          <ref role="37wK5l" to="hano:6QH_LDtcYUC" resolve="putType" />
                          <node concept="2OqwBi" id="6QH_LDteGcY" role="37wK5m">
                            <node concept="2JrnkZ" id="6QH_LDteEw4" role="2Oq$k0">
                              <node concept="3xONca" id="6QH_LDtetdX" role="2JrQYb">
                                <ref role="3xOPvv" node="6QH_LDtdU18" resolve="foo" />
                              </node>
                            </node>
                            <node concept="liA8E" id="6QH_LDteGDm" role="2OqNvi">
                              <ref role="37wK5l" to="mhbf:~SNode.getReference():org.jetbrains.mps.openapi.model.SNodeReference" resolve="getReference" />
                            </node>
                          </node>
                          <node concept="37vLTw" id="6QH_LDte_a_" role="37wK5m">
                            <ref role="3cqZAo" node="6QH_LDtewys" resolve="clsType" />
                          </node>
                        </node>
                      </node>
                    </node>
                    <node concept="3clFbH" id="6QH_LDtespS" role="3cqZAp" />
                  </node>
                  <node concept="37vLTG" id="6QH_LDtdXLR" role="1bW2Oz">
                    <property role="TrG5h" value="typeCache" />
                    <node concept="3uibUv" id="6QH_LDtdXLS" role="1tU5fm">
                      <ref role="3uigEE" to="hano:6QH_LDtcxgf" resolve="Typechecking.UpdatableTypeCache" />
                    </node>
                  </node>
                </node>
              </node>
            </node>
          </node>
        </node>
        <node concept="2Hmddi" id="6QH_LDtdY5q" role="3cqZAp">
          <node concept="37vLTw" id="6QH_LDtdYCG" role="2Hmdds">
            <ref role="3cqZAo" node="6QH_LDtdXLK" resolve="typeCache2" />
          </node>
        </node>
        <node concept="3clFbH" id="6QH_LDtdW91" role="3cqZAp" />
        <node concept="3cpWs8" id="6QH_LDtdZNt" role="3cqZAp">
          <node concept="3cpWsn" id="6QH_LDtdZNu" role="3cpWs9">
            <property role="TrG5h" value="typesCache3" />
            <node concept="3uibUv" id="6QH_LDtfmZy" role="1tU5fm">
              <ref role="3uigEE" to="hano:6QH_LDtfe19" resolve="Typechecking.TypeCache" />
            </node>
            <node concept="2OqwBi" id="6QH_LDtdZNv" role="33vP2m">
              <node concept="37vLTw" id="6QH_LDtdZNw" role="2Oq$k0">
                <ref role="3cqZAo" node="6QH_LDtdTgs" resolve="tc" />
              </node>
              <node concept="liA8E" id="6QH_LDtdZNx" role="2OqNvi">
                <ref role="37wK5l" to="hano:4Z$O9mrQJgp" resolve="cachedTypes" />
                <node concept="37vLTw" id="6QH_LDtdZNy" role="37wK5m">
                  <ref role="3cqZAo" node="6QH_LDtdVp4" resolve="unit" />
                </node>
              </node>
            </node>
          </node>
        </node>
        <node concept="3vMLTj" id="6QH_LDte06l" role="3cqZAp">
          <node concept="37vLTw" id="6QH_LDte0h9" role="3tpDZB">
            <ref role="3cqZAo" node="6QH_LDtdXLK" resolve="typeCache2" />
          </node>
          <node concept="37vLTw" id="6QH_LDte0rc" role="3tpDZA">
            <ref role="3cqZAo" node="6QH_LDtdZNu" resolve="typesCache3" />
          </node>
        </node>
        <node concept="3clFbH" id="6QH_LDteGYQ" role="3cqZAp" />
        <node concept="3cpWs8" id="6QH_LDteITH" role="3cqZAp">
          <node concept="3cpWsn" id="6QH_LDteITI" role="3cpWs9">
            <property role="TrG5h" value="typeOfFoo" />
            <node concept="3Tqbb2" id="6QH_LDteITC" role="1tU5fm" />
            <node concept="2OqwBi" id="6QH_LDteITJ" role="33vP2m">
              <node concept="37vLTw" id="6QH_LDteITK" role="2Oq$k0">
                <ref role="3cqZAo" node="6QH_LDtdZNu" resolve="typesCache3" />
              </node>
              <node concept="liA8E" id="6QH_LDteITL" role="2OqNvi">
                <ref role="37wK5l" to="hano:6QH_LDtffJj" resolve="typeOf" />
                <node concept="3xONca" id="6QH_LDteITM" role="37wK5m">
                  <ref role="3xOPvv" node="6QH_LDtdU18" resolve="foo" />
                </node>
              </node>
            </node>
          </node>
        </node>
        <node concept="3vwNmj" id="6QH_LDteJJk" role="3cqZAp">
          <node concept="2YFouu" id="6QH_LDtfLOH" role="3vwVQn">
            <node concept="37vLTw" id="6QH_LDtfLOI" role="3uHU7w">
              <ref role="3cqZAo" node="6QH_LDteITI" resolve="typeOfFoo" />
            </node>
            <node concept="2c44tf" id="6QH_LDtfLOJ" role="3uHU7B">
              <node concept="3uibUv" id="6QH_LDtfLOK" role="2c44tc">
                <node concept="2c44tb" id="6QH_LDtfLOL" role="lGtFl">
                  <property role="P3scX" value="f3061a53-9226-4cc5-a443-f952ceaf5816/1107535904670/1107535924139" />
                  <property role="2qtEX8" value="classifier" />
                  <property role="3hQQBS" value="ClassifierType" />
                  <node concept="3xONca" id="6QH_LDtfLOM" role="2c44t1">
                    <ref role="3xOPvv" node="6QH_LDtdU18" resolve="foo" />
                  </node>
                </node>
              </node>
            </node>
          </node>
        </node>
      </node>
    </node>
  </node>
  <node concept="1lH9Xt" id="6$7vuu2u9rP">
    <property role="TrG5h" value="TypecheckingFacade" />
    <node concept="2XrIbr" id="6$7vuu2vnWT" role="1qtyYc">
      <property role="TrG5h" value="sinkModel" />
      <node concept="H_c77" id="6$7vuu2vo3x" role="3clF45" />
      <node concept="3clFbS" id="6$7vuu2vnWV" role="3clF47">
        <node concept="3cpWs8" id="WJyfsglt8y" role="3cqZAp">
          <node concept="3cpWsn" id="WJyfsglt8z" role="3cpWs9">
            <property role="TrG5h" value="source" />
            <node concept="3uibUv" id="WJyfsgnH9z" role="1tU5fm">
              <ref role="3uigEE" to="pa15:~PersistenceUtil$InMemoryStreamDataSource" resolve="PersistenceUtil.InMemoryStreamDataSource" />
            </node>
            <node concept="2ShNRf" id="WJyfsglt8_" role="33vP2m">
              <node concept="1pGfFk" id="WJyfsglt8A" role="2ShVmc">
                <ref role="37wK5l" to="pa15:~PersistenceUtil$InMemoryStreamDataSource.&lt;init&gt;()" resolve="PersistenceUtil.InMemoryStreamDataSource" />
              </node>
            </node>
          </node>
        </node>
        <node concept="3cpWs8" id="WJyfsglt8B" role="3cqZAp">
          <node concept="3cpWsn" id="WJyfsglt8C" role="3cpWs9">
            <property role="TrG5h" value="options" />
            <node concept="3uibUv" id="WJyfsglt8D" role="1tU5fm">
              <ref role="3uigEE" to="33ny:~Map" resolve="Map" />
              <node concept="3uibUv" id="WJyfsglt8E" role="11_B2D">
                <ref role="3uigEE" to="wyt6:~String" resolve="String" />
              </node>
              <node concept="3uibUv" id="WJyfsglt8F" role="11_B2D">
                <ref role="3uigEE" to="wyt6:~String" resolve="String" />
              </node>
            </node>
            <node concept="2YIFZM" id="WJyfsglt8G" role="33vP2m">
              <ref role="1Pybhc" to="33ny:~Collections" resolve="Collections" />
              <ref role="37wK5l" to="33ny:~Collections.singletonMap(java.lang.Object,java.lang.Object):java.util.Map" resolve="singletonMap" />
              <node concept="10M0yZ" id="WJyfsglt8H" role="37wK5m">
                <ref role="1PxDUh" to="dush:~ModelFactory" resolve="ModelFactory" />
                <ref role="3cqZAo" to="dush:~ModelFactory.OPTION_MODELNAME" resolve="OPTION_MODELNAME" />
              </node>
              <node concept="Xl_RD" id="WJyfsglt8I" role="37wK5m">
                <property role="Xl_RC" value="types-model" />
              </node>
            </node>
          </node>
        </node>
        <node concept="3clFbF" id="6$7vuu2vviB" role="3cqZAp">
          <node concept="2OqwBi" id="2zU3cYq$lrv" role="3clFbG">
            <node concept="2OqwBi" id="2zU3cYq$lrw" role="2Oq$k0">
              <node concept="2YIFZM" id="2zU3cYq$lrx" role="2Oq$k0">
                <ref role="37wK5l" to="dush:~PersistenceFacade.getInstance():org.jetbrains.mps.openapi.persistence.PersistenceFacade" resolve="getInstance" />
                <ref role="1Pybhc" to="dush:~PersistenceFacade" resolve="PersistenceFacade" />
              </node>
              <node concept="liA8E" id="2zU3cYq$lry" role="2OqNvi">
                <ref role="37wK5l" to="dush:~PersistenceFacade.getDefaultModelFactory():org.jetbrains.mps.openapi.persistence.ModelFactory" resolve="getDefaultModelFactory" />
              </node>
            </node>
            <node concept="liA8E" id="2zU3cYq$lrz" role="2OqNvi">
              <ref role="37wK5l" to="dush:~ModelFactory.create(org.jetbrains.mps.openapi.persistence.DataSource,java.util.Map):org.jetbrains.mps.openapi.model.SModel" resolve="create" />
              <node concept="37vLTw" id="2zU3cYq$lr$" role="37wK5m">
                <ref role="3cqZAo" node="WJyfsglt8z" resolve="source" />
              </node>
              <node concept="37vLTw" id="2zU3cYq$lr_" role="37wK5m">
                <ref role="3cqZAo" node="WJyfsglt8C" resolve="options" />
              </node>
            </node>
          </node>
        </node>
      </node>
      <node concept="3Tm6S6" id="6$7vuu2vo3h" role="1B3o_S" />
      <node concept="3uibUv" id="6$7vuu2vuKr" role="Sfmx6">
        <ref role="3uigEE" to="guwi:~IOException" resolve="IOException" />
      </node>
    </node>
    <node concept="1LZb2c" id="6$7vuu2ubul" role="1SL9yI">
      <property role="TrG5h" value="typecheckingSteps" />
      <node concept="3cqZAl" id="6$7vuu2ubum" role="3clF45" />
      <node concept="3clFbS" id="6$7vuu2ubuq" role="3clF47">
        <node concept="3cpWs8" id="6$7vuu2ucVz" role="3cqZAp">
          <node concept="3cpWsn" id="6$7vuu2ucV$" role="3cpWs9">
            <property role="TrG5h" value="unit" />
            <node concept="H_c77" id="6$7vuu2ucVx" role="1tU5fm" />
            <node concept="2OqwBi" id="6$7vuu2ucV_" role="33vP2m">
              <node concept="3xONca" id="6$7vuu2ucVA" role="2Oq$k0">
                <ref role="3xOPvv" node="6$7vuu2ubYm" resolve="cls" />
              </node>
              <node concept="I4A8Y" id="6$7vuu2ucVB" role="2OqNvi" />
            </node>
          </node>
        </node>
        <node concept="3cpWs8" id="6$7vuu2ugbw" role="3cqZAp">
          <node concept="3cpWsn" id="6$7vuu2ugbx" role="3cpWs9">
            <property role="TrG5h" value="repository" />
            <node concept="3uibUv" id="6$7vuu2ugbs" role="1tU5fm">
              <ref role="3uigEE" to="lui2:~SRepository" resolve="SRepository" />
            </node>
            <node concept="2OqwBi" id="6$7vuu2ugby" role="33vP2m">
              <node concept="2JrnkZ" id="6$7vuu2ugbz" role="2Oq$k0">
                <node concept="37vLTw" id="6$7vuu2ugb$" role="2JrQYb">
                  <ref role="3cqZAo" node="6$7vuu2ucV$" resolve="unit" />
                </node>
              </node>
              <node concept="liA8E" id="6$7vuu2ugb_" role="2OqNvi">
                <ref role="37wK5l" to="mhbf:~SModel.getRepository():org.jetbrains.mps.openapi.module.SRepository" resolve="getRepository" />
              </node>
            </node>
          </node>
        </node>
        <node concept="3clFbH" id="6$7vuu2ugd_" role="3cqZAp" />
        <node concept="3cpWs8" id="6$7vuu2ugt2" role="3cqZAp">
          <node concept="3cpWsn" id="6$7vuu2ugt3" role="3cpWs9">
            <property role="TrG5h" value="tplApp" />
            <node concept="3uibUv" id="6$7vuu2ugsZ" role="1tU5fm">
              <ref role="3uigEE" to="hano:3GlpCDSxTG7" resolve="TypecheckingTemplates" />
            </node>
            <node concept="2ShNRf" id="6$7vuu2ugt4" role="33vP2m">
              <node concept="1pGfFk" id="6$7vuu2ugt5" role="2ShVmc">
                <ref role="37wK5l" to="hano:3GlpCDSychS" resolve="TypecheckingTemplates" />
                <node concept="37vLTw" id="6$7vuu2ugt6" role="37wK5m">
                  <ref role="3cqZAo" node="6$7vuu2ugbx" resolve="repository" />
                </node>
              </node>
            </node>
          </node>
        </node>
        <node concept="3cpWs8" id="6$7vuu2ujxQ" role="3cqZAp">
          <node concept="3cpWsn" id="6$7vuu2ujxR" role="3cpWs9">
            <property role="TrG5h" value="res" />
            <node concept="3uibUv" id="6$7vuu2ujxH" role="1tU5fm">
              <ref role="3uigEE" to="hano:7Oc59RSEjdb" resolve="Result" />
            </node>
            <node concept="2OqwBi" id="6$7vuu2ujxS" role="33vP2m">
              <node concept="37vLTw" id="6$7vuu2ujxT" role="2Oq$k0">
                <ref role="3cqZAo" node="6$7vuu2ugt3" resolve="tplApp" />
              </node>
              <node concept="liA8E" id="6$7vuu2ujxU" role="2OqNvi">
                <ref role="37wK5l" to="hano:3GlpCDSxTKz" resolve="applyTemplates" />
                <node concept="2OqwBi" id="6$7vuu2ujxV" role="37wK5m">
                  <node concept="3xONca" id="6$7vuu2ujxW" role="2Oq$k0">
                    <ref role="3xOPvv" node="6$7vuu2ubYm" resolve="cls" />
                  </node>
                  <node concept="2Rxl7S" id="6$7vuu2ujxX" role="2OqNvi" />
                </node>
                <node concept="Xl_RD" id="6$7vuu2ujxY" role="37wK5m">
                  <property role="Xl_RC" value="test" />
                </node>
              </node>
            </node>
          </node>
        </node>
        <node concept="3vwNmj" id="6$7vuu2usrD" role="3cqZAp">
          <node concept="2OqwBi" id="6$7vuu2usrE" role="3vwVQn">
            <node concept="37vLTw" id="6$7vuu2usrF" role="2Oq$k0">
              <ref role="3cqZAo" node="6$7vuu2ujxR" resolve="res" />
            </node>
            <node concept="liA8E" id="6$7vuu2usrG" role="2OqNvi">
              <ref role="37wK5l" to="hano:7Oc59RS_hsj" resolve="isSuccessful" />
            </node>
          </node>
        </node>
        <node concept="3clFbH" id="6$7vuu2usrC" role="3cqZAp" />
        <node concept="3cpWs8" id="6QH_LDtbV5P" role="3cqZAp">
          <node concept="3cpWsn" id="6QH_LDtbV5Q" role="3cpWs9">
            <property role="TrG5h" value="evaluator" />
            <node concept="3uibUv" id="6QH_LDtbV5R" role="1tU5fm">
              <ref role="3uigEE" to="hano:41ox5Vnk76a" resolve="ProgramEvaluator" />
            </node>
            <node concept="2ShNRf" id="6QH_LDtbV5S" role="33vP2m">
              <node concept="1pGfFk" id="6QH_LDtbV5T" role="2ShVmc">
                <ref role="37wK5l" to="hano:HV6urVFjOl" resolve="ProgramEvaluator" />
                <node concept="2ShNRf" id="6QH_LDtbV5U" role="37wK5m">
                  <node concept="1pGfFk" id="6QH_LDtbV5V" role="2ShVmc">
                    <ref role="37wK5l" to="cxk7:3F6vMxqo1c$" resolve="DefaultSessionSolver" />
                    <node concept="2OqwBi" id="6QH_LDtbV5W" role="37wK5m">
                      <node concept="37vLTw" id="6QH_LDtbV5X" role="2Oq$k0">
                        <ref role="3cqZAo" node="6$7vuu2ugt3" resolve="tplApp" />
                      </node>
                      <node concept="liA8E" id="6QH_LDtbV5Y" role="2OqNvi">
                        <ref role="37wK5l" to="hano:3GlpCDSyRnn" resolve="getExpressionSolver" />
                      </node>
                    </node>
                  </node>
                </node>
              </node>
            </node>
          </node>
        </node>
        <node concept="2GUZhq" id="6$7vuu2uPZO" role="3cqZAp">
          <node concept="3clFbS" id="6$7vuu2uPZQ" role="2GV8ay">
            <node concept="3clFbF" id="3F6vMxqjuT0" role="3cqZAp">
              <node concept="2OqwBi" id="3F6vMxqjuT1" role="3clFbG">
                <node concept="10M0yZ" id="5cDlfXt5oVE" role="2Oq$k0">
                  <ref role="3cqZAo" to="zx3l:~EvaluationSessionImpl.Companion" resolve="Companion" />
                  <ref role="1PxDUh" to="zx3l:~EvaluationSessionImpl" resolve="EvaluationSessionImpl" />
                </node>
                <node concept="liA8E" id="3F6vMxqjuT3" role="2OqNvi">
                  <ref role="37wK5l" to="zx3l:~EvaluationSessionImpl$Companion.init():void" resolve="init" />
                </node>
              </node>
            </node>
            <node concept="3clFbH" id="6$7vuu2uVEy" role="3cqZAp" />
            <node concept="3cpWs8" id="6QH_LDtbV6a" role="3cqZAp">
              <node concept="3cpWsn" id="6QH_LDtbV6b" role="3cpWs9">
                <property role="TrG5h" value="res2" />
                <node concept="3uibUv" id="6QH_LDtbV6c" role="1tU5fm">
                  <ref role="3uigEE" to="hano:7Oc59RSEjdb" resolve="Result" />
                </node>
                <node concept="2YIFZM" id="1CcQBrQs0eX" role="33vP2m">
                  <ref role="37wK5l" to="hano:7Oc59RSEjeq" resolve="OK" />
                  <ref role="1Pybhc" to="hano:7Oc59RSEjdb" resolve="Result" />
                </node>
              </node>
            </node>
            <node concept="1DcWWT" id="1CcQBrQrTBa" role="3cqZAp">
              <node concept="3clFbS" id="1CcQBrQrTBd" role="2LFqv$">
                <node concept="3cpWs8" id="6QH_LDtbV5I" role="3cqZAp">
                  <node concept="3cpWsn" id="6QH_LDtbV5J" role="3cpWs9">
                    <property role="TrG5h" value="config" />
                    <node concept="3uibUv" id="6QH_LDtbV5K" role="1tU5fm">
                      <ref role="3uigEE" to="w7la:~EvaluationSession$Config" resolve="EvaluationSession.Config" />
                    </node>
                    <node concept="2YIFZM" id="6QH_LDtbV5L" role="33vP2m">
                      <ref role="37wK5l" to="w7la:~EvaluationSession.newSession(jetbrains.mps.logic.reactor.program.Program):jetbrains.mps.logic.reactor.evaluation.EvaluationSession$Config" resolve="newSession" />
                      <ref role="1Pybhc" to="w7la:~EvaluationSession" resolve="EvaluationSession" />
                      <node concept="37vLTw" id="1CcQBrQrWi4" role="37wK5m">
                        <ref role="3cqZAo" node="1CcQBrQrTBe" resolve="program" />
                      </node>
                    </node>
                  </node>
                </node>
                <node concept="3clFbF" id="1CcQBrQrYPT" role="3cqZAp">
                  <node concept="37vLTI" id="1CcQBrQrYPV" role="3clFbG">
                    <node concept="37vLTw" id="1CcQBrQrYPZ" role="37vLTJ">
                      <ref role="3cqZAo" node="6QH_LDtbV6b" resolve="res2" />
                    </node>
                    <node concept="2OqwBi" id="1CcQBrQs3mU" role="37vLTx">
                      <node concept="37vLTw" id="1CcQBrQs3e7" role="2Oq$k0">
                        <ref role="3cqZAo" node="6QH_LDtbV6b" resolve="res2" />
                      </node>
                      <node concept="liA8E" id="1CcQBrQs3tX" role="2OqNvi">
                        <ref role="37wK5l" to="hano:7nkyKX7v7xb" resolve="and" />
                        <node concept="2OqwBi" id="6QH_LDtbV6d" role="37wK5m">
                          <node concept="37vLTw" id="6QH_LDtbV6e" role="2Oq$k0">
                            <ref role="3cqZAo" node="6QH_LDtbV5Q" resolve="evaluator" />
                          </node>
                          <node concept="liA8E" id="6QH_LDtbV6f" role="2OqNvi">
                            <ref role="37wK5l" to="hano:HV6urVFrQ9" resolve="eval" />
                            <node concept="37vLTw" id="6QH_LDtbV6g" role="37wK5m">
                              <ref role="3cqZAo" node="6QH_LDtbV5J" resolve="config" />
                            </node>
                            <node concept="10M0yZ" id="6QH_LDtbV6h" role="37wK5m">
                              <ref role="1PxDUh" to="yg8f:qubcdtxBiR" resolve="EvaluationTraceExt" />
                              <ref role="3cqZAo" to="yg8f:24Vro6cS5rK" resolve="NULL" />
                            </node>
                          </node>
                        </node>
                      </node>
                    </node>
                  </node>
                </node>
              </node>
              <node concept="3cpWsn" id="1CcQBrQrTBe" role="1Duv9x">
                <property role="TrG5h" value="program" />
                <node concept="3uibUv" id="1CcQBrQrTBi" role="1tU5fm">
                  <ref role="3uigEE" to="av0y:~Program" resolve="Program" />
                </node>
              </node>
              <node concept="2OqwBi" id="1CcQBrQrTBj" role="1DdaDG">
                <node concept="37vLTw" id="1CcQBrQrTBk" role="2Oq$k0">
                  <ref role="3cqZAo" node="6$7vuu2ugt3" resolve="tplApp" />
                </node>
                <node concept="liA8E" id="1CcQBrQrTBl" role="2OqNvi">
                  <ref role="37wK5l" to="hano:3GlpCDSyO$P" resolve="getPrograms" />
                </node>
              </node>
            </node>
            <node concept="3clFbH" id="1CcQBrQrSZj" role="3cqZAp" />
            <node concept="3vwNmj" id="6$7vuu2uk9h" role="3cqZAp">
              <node concept="2OqwBi" id="6$7vuu2uktV" role="3vwVQn">
                <node concept="37vLTw" id="6$7vuu2ut7B" role="2Oq$k0">
                  <ref role="3cqZAo" node="6QH_LDtbV6b" resolve="res2" />
                </node>
                <node concept="liA8E" id="6$7vuu2ukRI" role="2OqNvi">
                  <ref role="37wK5l" to="hano:7Oc59RS_hsj" resolve="isSuccessful" />
                </node>
              </node>
            </node>
            <node concept="3clFbH" id="6$7vuu2uPZP" role="3cqZAp" />
            <node concept="3cpWs8" id="1CcQBrQng1x" role="3cqZAp">
              <node concept="3cpWsn" id="1CcQBrQng1y" role="3cpWs9">
                <property role="TrG5h" value="types" />
                <node concept="3uibUv" id="1CcQBrQng1v" role="1tU5fm">
                  <ref role="3uigEE" to="hano:6HT7BWBSFOV" resolve="TypeCollector" />
                </node>
                <node concept="2ShNRf" id="1CcQBrQng1z" role="33vP2m">
                  <node concept="1pGfFk" id="1CcQBrQng1$" role="2ShVmc">
                    <ref role="37wK5l" to="hano:1CcQBrQmOiH" resolve="TypeCollector" />
                    <node concept="2OqwBi" id="1CcQBrQskR9" role="37wK5m">
                      <node concept="37vLTw" id="1CcQBrQskRa" role="2Oq$k0">
                        <ref role="3cqZAo" node="6QH_LDtbV5Q" resolve="evaluator" />
                      </node>
                      <node concept="liA8E" id="1CcQBrQskRb" role="2OqNvi">
                        <ref role="37wK5l" to="hano:5cnt3vh3pb_" resolve="storeView" />
                      </node>
                    </node>
                  </node>
                </node>
              </node>
            </node>
            <node concept="3vwNmj" id="6$7vuu2vV32" role="3cqZAp">
              <node concept="2YFouu" id="6$7vuu2vWLe" role="3vwVQn">
                <node concept="2c44tf" id="6$7vuu2vYs4" role="3uHU7B">
                  <node concept="3uibUv" id="6$7vuu2vZw6" role="2c44tc">
                    <ref role="3uigEE" to="wyt6:~String" resolve="String" />
                  </node>
                </node>
                <node concept="2OqwBi" id="1CcQBrQocIM" role="3uHU7w">
                  <node concept="37vLTw" id="1CcQBrQocCe" role="2Oq$k0">
                    <ref role="3cqZAo" node="1CcQBrQng1y" resolve="types" />
                  </node>
                  <node concept="liA8E" id="1CcQBrQoexC" role="2OqNvi">
                    <ref role="37wK5l" to="hano:1CcQBrQmO_H" resolve="typeNode" />
                    <node concept="2OqwBi" id="6$7vuu2w3U0" role="37wK5m">
                      <node concept="2JrnkZ" id="6$7vuu2w3Lh" role="2Oq$k0">
                        <node concept="3xONca" id="6$7vuu2w20p" role="2JrQYb">
                          <ref role="3xOPvv" node="6$7vuu2wqbE" resolve="expr" />
                        </node>
                      </node>
                      <node concept="liA8E" id="6$7vuu2w5d4" role="2OqNvi">
                        <ref role="37wK5l" to="mhbf:~SNode.getReference():org.jetbrains.mps.openapi.model.SNodeReference" resolve="getReference" />
                      </node>
                    </node>
                  </node>
                </node>
              </node>
            </node>
            <node concept="3clFbH" id="1CcQBrQslUW" role="3cqZAp" />
          </node>
          <node concept="3clFbS" id="6$7vuu2uPZR" role="2GVbov">
            <node concept="3clFbF" id="6$7vuu2uR6h" role="3cqZAp">
              <node concept="2OqwBi" id="6$7vuu2uR6i" role="3clFbG">
                <node concept="10M0yZ" id="5cDlfXt5oWB" role="2Oq$k0">
                  <ref role="3cqZAo" to="zx3l:~EvaluationSessionImpl.Companion" resolve="Companion" />
                  <ref role="1PxDUh" to="zx3l:~EvaluationSessionImpl" resolve="EvaluationSessionImpl" />
                </node>
                <node concept="liA8E" id="6$7vuu2uR6k" role="2OqNvi">
                  <ref role="37wK5l" to="zx3l:~EvaluationSessionImpl$Companion.deinit():void" resolve="deinit" />
                </node>
              </node>
            </node>
          </node>
        </node>
        <node concept="3clFbH" id="6$7vuu2vebj" role="3cqZAp" />
      </node>
    </node>
    <node concept="1LZb2c" id="6$7vuu2wFYI" role="1SL9yI">
      <property role="TrG5h" value="typecheckingFacade" />
      <node concept="3cqZAl" id="6$7vuu2wFYJ" role="3clF45" />
      <node concept="3clFbS" id="6$7vuu2wFYN" role="3clF47">
        <node concept="3cpWs8" id="6$7vuu2wKkc" role="3cqZAp">
          <node concept="3cpWsn" id="6$7vuu2wKkd" role="3cpWs9">
            <property role="TrG5h" value="unit" />
            <node concept="H_c77" id="6$7vuu2wKke" role="1tU5fm" />
            <node concept="2OqwBi" id="6$7vuu2wKkf" role="33vP2m">
              <node concept="3xONca" id="6$7vuu2wKkg" role="2Oq$k0">
                <ref role="3xOPvv" node="6$7vuu2ubYm" resolve="cls" />
              </node>
              <node concept="I4A8Y" id="6$7vuu2wKkh" role="2OqNvi" />
            </node>
          </node>
        </node>
        <node concept="3cpWs8" id="6$7vuu2wKki" role="3cqZAp">
          <node concept="3cpWsn" id="6$7vuu2wKkj" role="3cpWs9">
            <property role="TrG5h" value="repository" />
            <node concept="3uibUv" id="6$7vuu2wKkk" role="1tU5fm">
              <ref role="3uigEE" to="lui2:~SRepository" resolve="SRepository" />
            </node>
            <node concept="2OqwBi" id="6$7vuu2wKkl" role="33vP2m">
              <node concept="2JrnkZ" id="6$7vuu2wKkm" role="2Oq$k0">
                <node concept="37vLTw" id="6$7vuu2wKkn" role="2JrQYb">
                  <ref role="3cqZAo" node="6$7vuu2wKkd" resolve="unit" />
                </node>
              </node>
              <node concept="liA8E" id="6$7vuu2wKko" role="2OqNvi">
                <ref role="37wK5l" to="mhbf:~SModel.getRepository():org.jetbrains.mps.openapi.module.SRepository" resolve="getRepository" />
              </node>
            </node>
          </node>
        </node>
        <node concept="3clFbH" id="6$7vuu2wJjQ" role="3cqZAp" />
        <node concept="2GUZhq" id="6$7vuu2xvuu" role="3cqZAp">
          <node concept="3clFbS" id="6$7vuu2xvuw" role="2GV8ay">
            <node concept="3clFbF" id="6$7vuu2xwxg" role="3cqZAp">
              <node concept="2YIFZM" id="6$7vuu2xCvD" role="3clFbG">
                <ref role="37wK5l" to="umch:2zU3cYqyaC9" resolve="init" />
                <ref role="1Pybhc" to="umch:2zU3cYqxbbL" resolve="TypesModelManager" />
                <node concept="37vLTw" id="6$7vuu2xDwR" role="37wK5m">
                  <ref role="3cqZAo" node="6$7vuu2wKkj" resolve="repository" />
                </node>
              </node>
            </node>
            <node concept="3clFbH" id="6$7vuu2xEii" role="3cqZAp" />
            <node concept="3cpWs8" id="6$7vuu2wZdq" role="3cqZAp">
              <node concept="3cpWsn" id="6$7vuu2wZdr" role="3cpWs9">
                <property role="TrG5h" value="typeOfExpr" />
                <node concept="3Tqbb2" id="6$7vuu2wZdp" role="1tU5fm" />
                <node concept="2OqwBi" id="6$7vuu2wZds" role="33vP2m">
                  <node concept="2YIFZM" id="6$7vuu2wZdt" role="2Oq$k0">
                    <ref role="37wK5l" to="hano:7kaxm0sEy4A" resolve="getInstance" />
                    <ref role="1Pybhc" to="hano:7kaxm0sEy3e" resolve="TypecheckingFacade" />
                  </node>
                  <node concept="liA8E" id="6$7vuu2wZdu" role="2OqNvi">
                    <ref role="37wK5l" to="hano:7kaxm0sEBHs" resolve="typeOf" />
                    <node concept="3xONca" id="6$7vuu2wZdv" role="37wK5m">
                      <ref role="3xOPvv" node="6$7vuu2wqbE" resolve="expr" />
                    </node>
                  </node>
                </node>
              </node>
            </node>
            <node concept="3vwNmj" id="6$7vuu2wZgV" role="3cqZAp">
              <node concept="2YFouu" id="6$7vuu2wZgW" role="3vwVQn">
                <node concept="2c44tf" id="6$7vuu2wZh3" role="3uHU7B">
                  <node concept="3uibUv" id="6$7vuu2wZh4" role="2c44tc">
                    <ref role="3uigEE" to="wyt6:~String" resolve="String" />
                  </node>
                </node>
                <node concept="37vLTw" id="6$7vuu2x1Qn" role="3uHU7w">
                  <ref role="3cqZAo" node="6$7vuu2wZdr" resolve="typeOfExpr" />
                </node>
              </node>
            </node>
            <node concept="3clFbH" id="6$7vuu2xGtF" role="3cqZAp" />
            <node concept="3cpWs8" id="6$7vuu2xGoA" role="3cqZAp">
              <node concept="3cpWsn" id="6$7vuu2xGoB" role="3cpWs9">
                <property role="TrG5h" value="typeOfExpr2" />
                <node concept="3Tqbb2" id="6$7vuu2xGoC" role="1tU5fm" />
                <node concept="2OqwBi" id="6$7vuu2xGoD" role="33vP2m">
                  <node concept="2YIFZM" id="6$7vuu2xGoE" role="2Oq$k0">
                    <ref role="37wK5l" to="hano:7kaxm0sEy4A" resolve="getInstance" />
                    <ref role="1Pybhc" to="hano:7kaxm0sEy3e" resolve="TypecheckingFacade" />
                  </node>
                  <node concept="liA8E" id="6$7vuu2xGoF" role="2OqNvi">
                    <ref role="37wK5l" to="hano:7kaxm0sEBHs" resolve="typeOf" />
                    <node concept="3xONca" id="6$7vuu2xGoG" role="37wK5m">
                      <ref role="3xOPvv" node="6$7vuu2wqbE" resolve="expr" />
                    </node>
                  </node>
                </node>
              </node>
            </node>
            <node concept="3vMLTj" id="6$7vuu2xH$g" role="3cqZAp">
              <node concept="37vLTw" id="6$7vuu2xIBQ" role="3tpDZB">
                <ref role="3cqZAo" node="6$7vuu2wZdr" resolve="typeOfExpr" />
              </node>
              <node concept="37vLTw" id="6$7vuu2xJDk" role="3tpDZA">
                <ref role="3cqZAo" node="6$7vuu2xGoB" resolve="typeOfExpr2" />
              </node>
            </node>
            <node concept="3clFbH" id="6$7vuu2xDxg" role="3cqZAp" />
          </node>
          <node concept="3clFbS" id="6$7vuu2xvux" role="2GVbov">
            <node concept="3clFbF" id="6$7vuu2xDxB" role="3cqZAp">
              <node concept="2YIFZM" id="6$7vuu2xD$t" role="3clFbG">
                <ref role="37wK5l" to="umch:2zU3cYqyg2V" resolve="dispose" />
                <ref role="1Pybhc" to="umch:2zU3cYqxbbL" resolve="TypesModelManager" />
                <node concept="37vLTw" id="6$7vuu2xD$u" role="37wK5m">
                  <ref role="3cqZAo" node="6$7vuu2wKkj" resolve="repository" />
                </node>
              </node>
            </node>
          </node>
        </node>
      </node>
    </node>
    <node concept="1LZb2c" id="3u5wJtboAn" role="1SL9yI">
      <property role="TrG5h" value="typeOf" />
      <node concept="3cqZAl" id="3u5wJtboAo" role="3clF45" />
      <node concept="3clFbS" id="3u5wJtboAs" role="3clF47">
        <node concept="3cpWs8" id="3u5wJtbs79" role="3cqZAp">
          <node concept="3cpWsn" id="3u5wJtbs7a" role="3cpWs9">
            <property role="TrG5h" value="unit" />
            <node concept="H_c77" id="3u5wJtbs7b" role="1tU5fm" />
            <node concept="2OqwBi" id="3u5wJtbs7c" role="33vP2m">
              <node concept="3xONca" id="3u5wJtbs7d" role="2Oq$k0">
                <ref role="3xOPvv" node="6$7vuu2ubYm" resolve="cls" />
              </node>
              <node concept="I4A8Y" id="3u5wJtbs7e" role="2OqNvi" />
            </node>
          </node>
        </node>
        <node concept="3cpWs8" id="3u5wJtbs7f" role="3cqZAp">
          <node concept="3cpWsn" id="3u5wJtbs7g" role="3cpWs9">
            <property role="TrG5h" value="repository" />
            <node concept="3uibUv" id="3u5wJtbs7h" role="1tU5fm">
              <ref role="3uigEE" to="lui2:~SRepository" resolve="SRepository" />
            </node>
            <node concept="2OqwBi" id="3u5wJtbs7i" role="33vP2m">
              <node concept="2JrnkZ" id="3u5wJtbs7j" role="2Oq$k0">
                <node concept="37vLTw" id="3u5wJtbs7k" role="2JrQYb">
                  <ref role="3cqZAo" node="3u5wJtbs7a" resolve="unit" />
                </node>
              </node>
              <node concept="liA8E" id="3u5wJtbs7l" role="2OqNvi">
                <ref role="37wK5l" to="mhbf:~SModel.getRepository():org.jetbrains.mps.openapi.module.SRepository" resolve="getRepository" />
              </node>
            </node>
          </node>
        </node>
        <node concept="3clFbH" id="3u5wJtboNd" role="3cqZAp" />
        <node concept="2GUZhq" id="3u5wJtbtkT" role="3cqZAp">
          <node concept="3clFbS" id="3u5wJtbtkV" role="2GV8ay">
            <node concept="3clFbF" id="3u5wJtbusQ" role="3cqZAp">
              <node concept="2YIFZM" id="3u5wJtbusR" role="3clFbG">
                <ref role="37wK5l" to="umch:2zU3cYqyaC9" resolve="init" />
                <ref role="1Pybhc" to="umch:2zU3cYqxbbL" resolve="TypesModelManager" />
                <node concept="37vLTw" id="3u5wJtbusS" role="37wK5m">
                  <ref role="3cqZAo" node="3u5wJtbs7g" resolve="repository" />
                </node>
              </node>
            </node>
            <node concept="3clFbH" id="3u5wJtbwJS" role="3cqZAp" />
            <node concept="3cpWs8" id="3u5wJtbznu" role="3cqZAp">
              <node concept="3cpWsn" id="3u5wJtbznv" role="3cpWs9">
                <property role="TrG5h" value="typeOfExpr" />
                <node concept="3Tqbb2" id="3u5wJtbznr" role="1tU5fm" />
                <node concept="2OqwBi" id="3u5wJtbznw" role="33vP2m">
                  <node concept="3xONca" id="3u5wJtbznx" role="2Oq$k0">
                    <ref role="3xOPvv" node="6$7vuu2wqbE" resolve="expr" />
                  </node>
                  <node concept="2W$R8B" id="3u5wJtbzny" role="2OqNvi" />
                </node>
              </node>
            </node>
            <node concept="3vwNmj" id="3u5wJtb$z3" role="3cqZAp">
              <node concept="2YFouu" id="3u5wJtb$z4" role="3vwVQn">
                <node concept="2c44tf" id="3u5wJtb$z5" role="3uHU7B">
                  <node concept="3uibUv" id="3u5wJtb$z6" role="2c44tc">
                    <ref role="3uigEE" to="wyt6:~String" resolve="String" />
                  </node>
                </node>
                <node concept="37vLTw" id="3u5wJtb$z7" role="3uHU7w">
                  <ref role="3cqZAo" node="3u5wJtbznv" resolve="typeOfExpr" />
                </node>
              </node>
            </node>
            <node concept="3clFbH" id="3u5wJtb$yQ" role="3cqZAp" />
            <node concept="3cpWs8" id="3u5wJtbATo" role="3cqZAp">
              <node concept="3cpWsn" id="3u5wJtbATp" role="3cpWs9">
                <property role="TrG5h" value="typeOfExpr2" />
                <node concept="3Tqbb2" id="3u5wJtbATq" role="1tU5fm" />
                <node concept="2OqwBi" id="3u5wJtbATr" role="33vP2m">
                  <node concept="3xONca" id="3u5wJtbATs" role="2Oq$k0">
                    <ref role="3xOPvv" node="6$7vuu2wqbE" resolve="expr" />
                  </node>
                  <node concept="2W$R8B" id="3u5wJtbATt" role="2OqNvi" />
                </node>
              </node>
            </node>
            <node concept="3vMLTj" id="3u5wJtbAXi" role="3cqZAp">
              <node concept="37vLTw" id="3u5wJtbAXj" role="3tpDZB">
                <ref role="3cqZAo" node="3u5wJtbznv" resolve="typeOfExpr" />
              </node>
              <node concept="37vLTw" id="3u5wJtbAXk" role="3tpDZA">
                <ref role="3cqZAo" node="3u5wJtbATp" resolve="typeOfExpr2" />
              </node>
            </node>
            <node concept="3clFbH" id="3u5wJtbAWB" role="3cqZAp" />
          </node>
          <node concept="3clFbS" id="3u5wJtbtkW" role="2GVbov">
            <node concept="3clFbF" id="3u5wJtbv_Y" role="3cqZAp">
              <node concept="2YIFZM" id="3u5wJtbv_Z" role="3clFbG">
                <ref role="1Pybhc" to="umch:2zU3cYqxbbL" resolve="TypesModelManager" />
                <ref role="37wK5l" to="umch:2zU3cYqyg2V" resolve="dispose" />
                <node concept="37vLTw" id="3u5wJtbvA0" role="37wK5m">
                  <ref role="3cqZAo" node="3u5wJtbs7g" resolve="repository" />
                </node>
              </node>
            </node>
          </node>
        </node>
      </node>
    </node>
    <node concept="1qefOq" id="6$7vuu2uamm" role="1SKRRt">
      <node concept="312cEu" id="6$7vuu2uamo" role="1qenE9">
        <property role="TrG5h" value="Foo" />
        <node concept="3clFb_" id="6$7vuu2uaoc" role="jymVt">
          <property role="TrG5h" value="bar" />
          <node concept="37vLTG" id="6$7vuu2uaoM" role="3clF46">
            <property role="TrG5h" value="str" />
            <node concept="3uibUv" id="6$7vuu2uapo" role="1tU5fm">
              <ref role="3uigEE" to="wyt6:~String" resolve="String" />
            </node>
          </node>
          <node concept="3cqZAl" id="6$7vuu2uaoe" role="3clF45" />
          <node concept="3Tm1VV" id="6$7vuu2uaof" role="1B3o_S" />
          <node concept="3clFbS" id="6$7vuu2uaog" role="3clF47">
            <node concept="3clFbF" id="6$7vuu2uasa" role="3cqZAp">
              <node concept="1rXfSq" id="6$7vuu2uas9" role="3clFbG">
                <ref role="37wK5l" node="6$7vuu2uaqf" resolve="bazz" />
                <node concept="37vLTw" id="6$7vuu2woUY" role="37wK5m">
                  <ref role="3cqZAo" node="6$7vuu2uaoM" resolve="str" />
                  <node concept="3xLA65" id="6$7vuu2wqbE" role="lGtFl">
                    <property role="TrG5h" value="expr" />
                  </node>
                </node>
              </node>
            </node>
          </node>
        </node>
        <node concept="3clFb_" id="6$7vuu2uaqf" role="jymVt">
          <property role="TrG5h" value="bazz" />
          <node concept="37vLTG" id="6$7vuu2uaqV" role="3clF46">
            <property role="TrG5h" value="obj" />
            <node concept="3uibUv" id="6$7vuu2uarh" role="1tU5fm">
              <ref role="3uigEE" to="wyt6:~Object" resolve="Object" />
            </node>
          </node>
          <node concept="3cqZAl" id="6$7vuu2uaqh" role="3clF45" />
          <node concept="3Tm1VV" id="6$7vuu2uaqi" role="1B3o_S" />
          <node concept="3clFbS" id="6$7vuu2uaqj" role="3clF47" />
        </node>
        <node concept="3Tm1VV" id="6$7vuu2uamp" role="1B3o_S" />
        <node concept="3xLA65" id="6$7vuu2ubYm" role="lGtFl">
          <property role="TrG5h" value="cls" />
        </node>
      </node>
    </node>
  </node>
  <node concept="1lH9Xt" id="4nxCIBqxR0M">
    <property role="TrG5h" value="SampleTypeAspect" />
    <node concept="2XrIbr" id="7y50OW6ZKyB" role="1qtyYc">
      <property role="TrG5h" value="typeTemplates" />
      <node concept="37vLTG" id="7y50OW6ZKKa" role="3clF46">
        <property role="TrG5h" value="model" />
        <node concept="H_c77" id="7y50OW6ZKLy" role="1tU5fm" />
      </node>
      <node concept="3uibUv" id="7y50OW6ZKHy" role="3clF45">
        <ref role="3uigEE" to="fqlx:1hX44vNlSIA" resolve="TypeTemplateIndex" />
      </node>
      <node concept="3clFbS" id="7y50OW6ZKyD" role="3clF47">
        <node concept="3SKdUt" id="7y50OW707GY" role="3cqZAp">
          <node concept="3SKdUq" id="7y50OW707H0" role="3SKWNk">
            <property role="3SKdUp" value="FIXME: assuming the model imports only one lang with types aspect" />
          </node>
        </node>
        <node concept="3cpWs8" id="7y50OW6ZLiA" role="3cqZAp">
          <node concept="3cpWsn" id="7y50OW6ZLiB" role="3cpWs9">
            <property role="TrG5h" value="typeAspect" />
            <node concept="3uibUv" id="7y50OW6ZLiC" role="1tU5fm">
              <ref role="3uigEE" to="fqlx:7km57Pkjxf4" resolve="TypeAspectDescriptor" />
            </node>
            <node concept="2OqwBi" id="7y50OW6ZLiD" role="33vP2m">
              <node concept="2WthIp" id="7y50OW6ZLiE" role="2Oq$k0" />
              <node concept="2XshWL" id="7y50OW6ZLiF" role="2OqNvi">
                <ref role="2WH_rO" node="4nxCIBqxS8B" resolve="firstTypeAspect" />
                <node concept="37vLTw" id="7y50OW6ZLut" role="2XxRq1">
                  <ref role="3cqZAo" node="7y50OW6ZKKa" resolve="model" />
                </node>
              </node>
            </node>
          </node>
        </node>
        <node concept="3cpWs8" id="7y50OW6ZS1_" role="3cqZAp">
          <node concept="3cpWsn" id="7y50OW6ZS1A" role="3cpWs9">
            <property role="TrG5h" value="typeTemplates" />
            <node concept="3uibUv" id="7y50OW6ZS1r" role="1tU5fm">
              <ref role="3uigEE" to="fqlx:1hX44vNlSIA" resolve="TypeTemplateIndex" />
            </node>
            <node concept="2ShNRf" id="7y50OW6ZS1B" role="33vP2m">
              <node concept="1pGfFk" id="7y50OW6ZS1C" role="2ShVmc">
                <ref role="37wK5l" to="fqlx:1hX44vNlSOK" resolve="TypeTemplateIndex" />
                <node concept="2OqwBi" id="7y50OW6ZS1D" role="37wK5m">
                  <node concept="37vLTw" id="7y50OW6ZS1E" role="2Oq$k0">
                    <ref role="3cqZAo" node="7y50OW6ZLiB" resolve="typeAspect" />
                  </node>
                  <node concept="liA8E" id="7y50OW6ZS1F" role="2OqNvi">
                    <ref role="37wK5l" to="fqlx:2hteS6ClmbE" resolve="createTypeManifest" />
                  </node>
                </node>
              </node>
            </node>
          </node>
        </node>
        <node concept="3SKdUt" id="7y50OW70aZa" role="3cqZAp">
          <node concept="3SKdUq" id="7y50OW70aZc" role="3SKWNk">
            <property role="3SKdUp" value="FIXME: assuming the type aspect defines only single type table" />
          </node>
        </node>
        <node concept="3vMLTj" id="7y50OW6ZSAE" role="3cqZAp">
          <node concept="3cmrfG" id="7y50OW6ZSBN" role="3tpDZB">
            <property role="3cmrfH" value="1" />
          </node>
          <node concept="2OqwBi" id="7y50OW6ZUrY" role="3tpDZA">
            <node concept="2OqwBi" id="7y50OW6ZTd5" role="2Oq$k0">
              <node concept="37vLTw" id="7y50OW6ZT8n" role="2Oq$k0">
                <ref role="3cqZAo" node="7y50OW6ZS1A" resolve="typeTemplates" />
              </node>
              <node concept="liA8E" id="7y50OW6ZU4F" role="2OqNvi">
                <ref role="37wK5l" to="fqlx:4JJCDIn5F0n" resolve="typeTables" />
              </node>
            </node>
            <node concept="34oBXx" id="7y50OW6ZVmR" role="2OqNvi" />
          </node>
        </node>
        <node concept="3clFbF" id="7y50OW6ZM3q" role="3cqZAp">
          <node concept="37vLTw" id="7y50OW6ZS1G" role="3clFbG">
            <ref role="3cqZAo" node="7y50OW6ZS1A" resolve="typeTemplates" />
          </node>
        </node>
      </node>
    </node>
    <node concept="1LZb2c" id="7y50OW6TxjM" role="1SL9yI">
      <property role="TrG5h" value="typechecking" />
      <node concept="3cqZAl" id="7y50OW6TxjN" role="3clF45" />
      <node concept="3clFbS" id="7y50OW6TxjR" role="3clF47">
        <node concept="3cpWs8" id="7y50OW6ZE44" role="3cqZAp">
          <node concept="3cpWsn" id="7y50OW6ZE45" role="3cpWs9">
            <property role="TrG5h" value="checkTypes" />
            <node concept="3uibUv" id="7y50OW6ZE42" role="1tU5fm">
              <ref role="3uigEE" to="t5kh:7y50OW6XXpr" resolve="LaunchTypechecking.TypecheckingResult" />
            </node>
            <node concept="2YIFZM" id="7y50OW6ZE46" role="33vP2m">
              <ref role="37wK5l" to="t5kh:7y50OW6XU7p" resolve="checkTypes" />
              <ref role="1Pybhc" to="t5kh:1N_0WA5JxZO" resolve="LaunchTypechecking" />
              <node concept="3xONca" id="7y50OW6ZE47" role="37wK5m">
                <ref role="3xOPvv" node="4nxCIBqymjB" resolve="class" />
              </node>
              <node concept="1jxXqW" id="7y50OW6ZE48" role="37wK5m" />
            </node>
          </node>
        </node>
        <node concept="3ykFI1" id="7y50OW6U9jy" role="3cqZAp">
          <node concept="2OqwBi" id="7y50OW6ZEh5" role="3ykU8v">
            <node concept="37vLTw" id="7y50OW6ZE8H" role="2Oq$k0">
              <ref role="3cqZAo" node="7y50OW6ZE45" resolve="checkTypes" />
            </node>
            <node concept="liA8E" id="7y50OW6ZEtL" role="2OqNvi">
              <ref role="37wK5l" to="t5kh:7y50OW6Y0Sl" resolve="error" />
            </node>
          </node>
        </node>
        <node concept="3clFbH" id="7y50OW6ZGv$" role="3cqZAp" />
        <node concept="3cpWs8" id="52a_GfIM9UR" role="3cqZAp">
          <node concept="3cpWsn" id="52a_GfIM9US" role="3cpWs9">
            <property role="TrG5h" value="typeModel" />
            <node concept="3uibUv" id="52a_GfIM9UP" role="1tU5fm">
              <ref role="3uigEE" to="mhbf:~SModel" resolve="SModel" />
            </node>
            <node concept="2OqwBi" id="52a_GfIM9UT" role="33vP2m">
              <node concept="2YIFZM" id="52a_GfIM9UU" role="2Oq$k0">
                <ref role="1Pybhc" to="tqvn:~TemporaryModels" resolve="TemporaryModels" />
                <ref role="37wK5l" to="tqvn:~TemporaryModels.getInstance():jetbrains.mps.smodel.tempmodel.TemporaryModels" resolve="getInstance" />
              </node>
              <node concept="liA8E" id="52a_GfIM9UV" role="2OqNvi">
                <ref role="37wK5l" to="tqvn:~TemporaryModels.create(boolean,jetbrains.mps.smodel.tempmodel.TempModuleOptions):org.jetbrains.mps.openapi.model.SModel" resolve="create" />
                <node concept="3clFbT" id="52a_GfIM9UW" role="37wK5m">
                  <property role="3clFbU" value="true" />
                </node>
                <node concept="2YIFZM" id="52a_GfIM9UX" role="37wK5m">
                  <ref role="1Pybhc" to="tqvn:~TempModuleOptions" resolve="TempModuleOptions" />
                  <ref role="37wK5l" to="tqvn:~TempModuleOptions.forDefaultModule():jetbrains.mps.smodel.tempmodel.TempModuleOptions" resolve="forDefaultModule" />
                </node>
              </node>
            </node>
          </node>
        </node>
        <node concept="3clFbH" id="7y50OW700$V" role="3cqZAp" />
        <node concept="3cpWs8" id="7y50OW6ZH4l" role="3cqZAp">
          <node concept="3cpWsn" id="7y50OW6ZH4m" role="3cpWs9">
            <property role="TrG5h" value="termA" />
            <node concept="3uibUv" id="7y50OW6ZH4g" role="1tU5fm">
              <ref role="3uigEE" to="6exd:1bm7a6EXvsP" resolve="TreeForm" />
            </node>
            <node concept="2OqwBi" id="7y50OW6ZH4n" role="33vP2m">
              <node concept="37vLTw" id="7y50OW6ZH4o" role="2Oq$k0">
                <ref role="3cqZAo" node="7y50OW6ZE45" resolve="checkTypes" />
              </node>
              <node concept="liA8E" id="7y50OW6ZH4p" role="2OqNvi">
                <ref role="37wK5l" to="t5kh:7y50OW6XYoC" resolve="getType" />
                <node concept="3xONca" id="7y50OW6ZH4q" role="37wK5m">
                  <ref role="3xOPvv" node="1eKXYsjuWjw" resolve="fieldA" />
                </node>
              </node>
            </node>
          </node>
        </node>
        <node concept="3cpWs8" id="7y50OW701J0" role="3cqZAp">
          <node concept="3cpWsn" id="7y50OW701J1" role="3cpWs9">
            <property role="TrG5h" value="termB" />
            <node concept="3uibUv" id="7y50OW701J2" role="1tU5fm">
              <ref role="3uigEE" to="6exd:1bm7a6EXvsP" resolve="TreeForm" />
            </node>
            <node concept="2OqwBi" id="7y50OW701J3" role="33vP2m">
              <node concept="37vLTw" id="7y50OW701J4" role="2Oq$k0">
                <ref role="3cqZAo" node="7y50OW6ZE45" resolve="checkTypes" />
              </node>
              <node concept="liA8E" id="7y50OW701J5" role="2OqNvi">
                <ref role="37wK5l" to="t5kh:7y50OW6XYoC" resolve="getType" />
                <node concept="3xONca" id="7y50OW701Tq" role="37wK5m">
                  <ref role="3xOPvv" node="7y50OW6ZXVj" resolve="fieldB" />
                </node>
              </node>
            </node>
          </node>
        </node>
        <node concept="2Hmddi" id="7y50OW6ZIlS" role="3cqZAp">
          <node concept="37vLTw" id="7y50OW6ZISl" role="2Hmdds">
            <ref role="3cqZAo" node="7y50OW6ZH4m" resolve="termA" />
          </node>
        </node>
        <node concept="2Hmddi" id="7y50OW70203" role="3cqZAp">
          <node concept="37vLTw" id="7y50OW7026g" role="2Hmdds">
            <ref role="3cqZAo" node="7y50OW701J1" resolve="termB" />
          </node>
        </node>
        <node concept="3clFbH" id="52a_GfIMadO" role="3cqZAp" />
        <node concept="3clFbF" id="52a_GfIM6S5" role="3cqZAp">
          <node concept="2OqwBi" id="52a_GfIM72F" role="3clFbG">
            <node concept="2YIFZM" id="52a_GfIM6S7" role="2Oq$k0">
              <ref role="37wK5l" to="tqvn:~TemporaryModels.getInstance():jetbrains.mps.smodel.tempmodel.TemporaryModels" resolve="getInstance" />
              <ref role="1Pybhc" to="tqvn:~TemporaryModels" resolve="TemporaryModels" />
            </node>
            <node concept="liA8E" id="52a_GfIM7aQ" role="2OqNvi">
              <ref role="37wK5l" to="tqvn:~TemporaryModels.dispose(org.jetbrains.mps.openapi.model.SModel):void" resolve="dispose" />
              <node concept="37vLTw" id="52a_GfIM7E$" role="37wK5m">
                <ref role="3cqZAo" node="52a_GfIM9US" resolve="typeModel" />
              </node>
            </node>
          </node>
        </node>
      </node>
    </node>
    <node concept="2XrIbr" id="4nxCIBqxS8B" role="1qtyYc">
      <property role="TrG5h" value="firstTypeAspect" />
      <node concept="37vLTG" id="4nxCIBqxTLY" role="3clF46">
        <property role="TrG5h" value="model" />
        <node concept="H_c77" id="4nxCIBqxVB6" role="1tU5fm" />
      </node>
      <node concept="3uibUv" id="4nxCIBqxS8S" role="3clF45">
        <ref role="3uigEE" to="fqlx:7km57Pkjxf4" resolve="TypeAspectDescriptor" />
      </node>
      <node concept="3clFbS" id="4nxCIBqxS8D" role="3clF47">
        <node concept="3cpWs8" id="4hh0cTRbUS6" role="3cqZAp">
          <node concept="3cpWsn" id="4hh0cTRbUS7" role="3cpWs9">
            <property role="TrG5h" value="typesAspect" />
            <node concept="3uibUv" id="4hh0cTRbURZ" role="1tU5fm">
              <ref role="3uigEE" to="fqlx:7km57Pkjxf4" resolve="TypeAspectDescriptor" />
            </node>
            <node concept="10Nm6u" id="4xTpErk1C4t" role="33vP2m" />
          </node>
        </node>
        <node concept="1DcWWT" id="4xTpErk1pjs" role="3cqZAp">
          <node concept="3clFbS" id="4xTpErk1pju" role="2LFqv$">
            <node concept="3clFbF" id="4xTpErk1zEf" role="3cqZAp">
              <node concept="37vLTI" id="4xTpErk1zEh" role="3clFbG">
                <node concept="2YIFZM" id="4hh0cTRbUS8" role="37vLTx">
                  <ref role="37wK5l" to="fqlx:2hteS6Cndm6" resolve="forLanguage" />
                  <ref role="1Pybhc" to="fqlx:7km57Pkjxf4" resolve="TypeAspectDescriptor" />
                  <node concept="37vLTw" id="4xTpErk25DG" role="37wK5m">
                    <ref role="3cqZAo" node="4xTpErk1pjv" resolve="lang" />
                  </node>
                  <node concept="2OqwBi" id="3GlpCDS_oBV" role="37wK5m">
                    <node concept="1jxXqW" id="4nxCIBqypgi" role="2Oq$k0" />
                    <node concept="liA8E" id="3GlpCDS_pPw" role="2OqNvi">
                      <ref role="37wK5l" to="z1c3:~Project.getRepository():org.jetbrains.mps.openapi.module.SRepository" resolve="getRepository" />
                    </node>
                  </node>
                </node>
                <node concept="37vLTw" id="4xTpErk1zEl" role="37vLTJ">
                  <ref role="3cqZAo" node="4hh0cTRbUS7" resolve="typesAspect" />
                </node>
              </node>
            </node>
            <node concept="3clFbJ" id="4xTpErk1MGG" role="3cqZAp">
              <node concept="3clFbS" id="4xTpErk1MGI" role="3clFbx">
                <node concept="3zACq4" id="4xTpErk1V4q" role="3cqZAp" />
              </node>
              <node concept="3y3z36" id="4xTpErk1S34" role="3clFbw">
                <node concept="10Nm6u" id="4xTpErk1SiT" role="3uHU7w" />
                <node concept="37vLTw" id="4xTpErk1PF$" role="3uHU7B">
                  <ref role="3cqZAo" node="4hh0cTRbUS7" resolve="typesAspect" />
                </node>
              </node>
            </node>
          </node>
          <node concept="3cpWsn" id="4xTpErk1pjv" role="1Duv9x">
            <property role="TrG5h" value="lang" />
            <node concept="3uibUv" id="4xTpErk1xEI" role="1tU5fm">
              <ref role="3uigEE" to="c17a:~SLanguage" resolve="SLanguage" />
            </node>
          </node>
          <node concept="2YIFZM" id="4xTpErk1vp3" role="1DdaDG">
            <ref role="1Pybhc" to="w1kc:~SModelOperations" resolve="SModelOperations" />
            <ref role="37wK5l" to="w1kc:~SModelOperations.getAllLanguageImports(org.jetbrains.mps.openapi.model.SModel):java.util.Set" resolve="getAllLanguageImports" />
            <node concept="37vLTw" id="4nxCIBqxXz7" role="37wK5m">
              <ref role="3cqZAo" node="4nxCIBqxTLY" resolve="model" />
            </node>
          </node>
        </node>
        <node concept="3cpWs6" id="4nxCIBqxY1M" role="3cqZAp">
          <node concept="37vLTw" id="4nxCIBqxYTl" role="3cqZAk">
            <ref role="3cqZAo" node="4hh0cTRbUS7" resolve="typesAspect" />
          </node>
        </node>
      </node>
    </node>
    <node concept="1qefOq" id="4nxCIBqyl_2" role="1SKRRt">
      <node concept="312cEu" id="4nxCIBqyl_d" role="1qenE9">
        <property role="TrG5h" value="Test" />
        <node concept="2tJIrI" id="1eKXYsjuV4O" role="jymVt" />
        <node concept="3HP615" id="4cKdPpqIRLR" role="jymVt">
          <property role="2bfB8j" value="true" />
          <property role="TrG5h" value="A" />
          <node concept="3Tm1VV" id="4cKdPpqIRLS" role="1B3o_S" />
        </node>
        <node concept="2tJIrI" id="7y50OW6ZXx0" role="jymVt" />
        <node concept="3HP615" id="7y50OW6ZXcE" role="jymVt">
          <property role="2bfB8j" value="true" />
          <property role="TrG5h" value="B" />
          <node concept="3Tm1VV" id="7y50OW6ZXcF" role="1B3o_S" />
          <node concept="16euLQ" id="7y50OW6ZXOs" role="16eVyc">
            <property role="TrG5h" value="T" />
          </node>
        </node>
        <node concept="2tJIrI" id="4cKdPpqKZY1" role="jymVt" />
        <node concept="312cEg" id="1eKXYsjuVRn" role="jymVt">
          <property role="TrG5h" value="fielda" />
          <node concept="3Tm6S6" id="1eKXYsjuVRo" role="1B3o_S" />
          <node concept="3uibUv" id="1eKXYsjuVYY" role="1tU5fm">
            <ref role="3uigEE" node="4cKdPpqIRLR" resolve="Test.A" />
            <node concept="3xLA65" id="1eKXYsjHW0A" role="lGtFl">
              <property role="TrG5h" value="typeA" />
            </node>
          </node>
          <node concept="3xLA65" id="1eKXYsjuWjw" role="lGtFl">
            <property role="TrG5h" value="fieldA" />
          </node>
        </node>
        <node concept="2tJIrI" id="7y50OW6ZYeS" role="jymVt" />
        <node concept="312cEg" id="7y50OW6ZXVf" role="jymVt">
          <property role="TrG5h" value="fieldb" />
          <node concept="3Tm6S6" id="7y50OW6ZXVg" role="1B3o_S" />
          <node concept="3uibUv" id="7y50OW6ZXVh" role="1tU5fm">
            <ref role="3uigEE" node="7y50OW6ZXcE" resolve="Test.B" />
            <node concept="3xLA65" id="7y50OW6ZXVi" role="lGtFl">
              <property role="TrG5h" value="typeB" />
            </node>
            <node concept="3uibUv" id="7y50OW6ZYzh" role="11_B2D">
              <ref role="3uigEE" node="4cKdPpqIRLR" resolve="Test.A" />
            </node>
          </node>
          <node concept="3xLA65" id="7y50OW6ZXVj" role="lGtFl">
            <property role="TrG5h" value="fieldB" />
          </node>
        </node>
        <node concept="3Tm1VV" id="4nxCIBqyl_e" role="1B3o_S" />
        <node concept="3xLA65" id="4nxCIBqymjB" role="lGtFl">
          <property role="TrG5h" value="class" />
        </node>
      </node>
    </node>
  </node>
</model>
