# hexDSL

**DSL** toolkit written in Haxe. 

---

![diagram](resource/schema-dsl.png)  <!-- .element: style="border: 0; background: None; box-shadow: None; max-height:640px" -->

---

## Domain-Specific language ? 

 > Computer language specialized to a particular application domain


Can also be descried as a mini-language targeted to a particular kind of problem.  
Think about `RegExp`, `HTML`, `CSS`, `Ant`

---

## For what ?

**DSL** in `hexMachina` is used as a configuration language. 
<!--
As an architectural framework `hexMachina` uses **DSL** to configure relations between all entities in the application. 
-->

---

## More than one language

`hexDSL` is 
* 2 languages : `XML` and `flow`
* 5 engines : 
  * `BasicStaticXmlCompiler`, `BasicXmlCompiler`, `BasicXmlReader`, 
  * `BasicStaticFlowCompiler`, `BasicFlowCompiler`

This workshop is only focused on **StaticCompilers**. 

---

## StaticCompilers ? 

By Macro, **DSL** is converted in Haxe code, and then compiled to target language. 

This solution privide all the power of Haxe compiler, type checking, auto-completion in IDE...
<!--
code generated + generate a class + each
-->

---

## Hello World

```xml
<root name="contextID">
    <test id="s" value="Hello world !">
</root>
```
// convert hello word to schema

<!--
## Declarative programming

Order has no importance! 

## Domain and Context

**DSL** code is executed in `Context`. 

Each `Context` are identified by `Domain`. 
-->

---

# Simple Instanciation

--

### Primitives
```xml
<root>
  <test id="s" value="hello"/>
  <test id="i" type="Int" value="-3"/>
  <test id="h" type="Int" value="0xFFFFFF"/>
  <test id="u" type="UInt" value="3"/>
  <test id="b" type="Bool" value="true"/>
  <test id="n" type="null"/>
</root>
```
Generated Haxe
```haxe
public var s:String;
public var i:Int;
public var h:Int;
public var u:UInt;
public var b:Bool;
public var n:Dynamic;

public function m_f276878bc4550514b52bbd06bac65d48() 
{
    var s = "hello";
    this.s = s;
    var i = -3;
    this.i = i;
    var h = 16777215;
    this.h = h;
    var u = 3;
    this.u = u;
    var b = true;
    this.b = b;
    var n = null;
    this.n = n;
}
```
<!--
```haxe
class hex.context.applicationContext implements hex.context.IapplicationContext_0 
{
  public var s:String;
  public var i:Int;
  public var h:Int;
  public var u:UInt;
  public var b:Bool;
  public var n:Dynamic;

  public function m_f276878bc4550514b52bbd06bac65d48() 
  {
      var s = "hello";
      this.s = s;
      var i = -3;
      this.i = i;
      var h = 16777215;
      this.h = h;
      var u = 3;
      this.u = u;
      var b = true;
      this.b = b;
      var n = null;
      this.n = n;
  }
}
```
-->

--

## Simple class instance 

```xml
<bean id="instance" type="hex.mock.MockClassWithoutArgument"/>
```
Generated Haxe
```haxe 
var instance = new hex.mock.MockClassWithoutArgument();
```

---

# Exercise 1

---

# Instanciation with arguments, and properties

--

### with arguments
```xml
<test id="d" type="Date">
  <argument type="Int" value="2013"/>
  <argument type="Int" value="12"/>
  <argument type="Int" value="2"/>
  <argument type="Int" value="12"/>
  <argument type="Int" value="9"/>
  <argument type="Int" value="0"/>
</test>
```
Generated Haxe
```haxe
var d = new Date(2013, 12, 2, 12, 9, 0);
```

--

### Anonymous object with properties
```xml
<test id="obj" type="Object">
  <property name="name" value="Francis"/>
  <property name="age" type="Int" value="44"/>
  <property name="height" type="Float" value="1.75"/>
  <property name="isWorking" type="Bool" value="true"/>
  <property name="isSleeping" type="Bool" value="false"/>
</test>
```
Generated Haxe
```haxe
var obj = {};
obj.name = "Francis";
obj.age = 44;
obj.height = 1.75;
obj.isWorking = true;
obj.isSleeping = false;
```

---

# Exercise 2

---

# References

--

### Array Filled With References
```xml
<collection id="colors" type="Array<Int>">
  <argument ref="black" />
  <argument ref="white" />
  <argument ref="red" />
  <argument ref="green" />
  <argument ref="blue" />
</collection>

<test id="black" type="Int" value="0x000000"/>
<test id="white" type="Int" value="0xFFFFFF"/>
<test id="red" type="Int" value="0xFF0000"/>
<test id="green" type="Int" value="0x00FF00"/>
<test id="blue" type="Int" value="0x0000FF"/>
```
Generated Haxe
```haxe
var black = 0;
var white = 16777215;
var red = 16711680;
var green = 65280;
var blue = 255;

var colors = [black, white, red, green, blue];
```

--

### Instance with arguments references
```xml
<rectangle id="rect" type="js.html.DOMRect">
    <argument ref="rectPosition.x"/>
    <argument ref="rectPosition.y"/>
    <argument ref="rectSize.x"/>
    <argument ref="rectSize.y"/>
</rectangle>

<size id="rectSize" type="hex.structures.Point">
    <argument type="Int" value="30"/>
    <argument type="Int" value="40"/>
</size>

<position id="rectPosition" type="hex.structures.Point">
    <property type="Int" name="x" value="10"/>
    <property type="Int" name="y" value="20"/>
</position>
```
Generated Haxe
```haxe
var this1 = {x : 0, y : 0};
var rectPosition = cast this1;
cast rectPosition.x = 10;
cast rectPosition.y = 20;
var this2 = {x : 30, y : 40};
var rectSize = cast this2;
var rect = new DOMRect(cast rectPosition.x, cast rectPosition.y, cast rectSize.x, cast rectSize.y);
```

--

### Class reference
```xml
<node id="classContainer" type="Object">
  <property name="classReference" ref="request"/>
</node>

<node id="request" type="Class" value="haxe.web.Request"/>
```
Generated Haxe
```haxe
public var request:Class<haxe.web.Request>;
public var classContainer:Dynamic;

... 

var request = haxe.web.Request;
var classContainer = {};
classContainer.classReference = request;
```

--

### Static reference
```xml
<node id="logLevels" type="Array<hex.log.LogLevel>">
  <argument static-ref="hex.log.LogLevel.ALL"/>
  <argument static-ref="hex.log.LogLevel.DEBUG"/>
  <argument static-ref="hex.log.LogLevel.INFO"/>
  <argument static-ref="hex.log.LogLevel.WARN"/>
  <argument static-ref="hex.log.LogLevel.ERROR"/>
  <argument static-ref="hex.log.LogLevel.FATAL"/>
</node>
```
Generated Haxe
```haxe
// hex.log.LogLevel is abstract class
var basicTypes = [ 
  hex.log._LogLevel.LogLevel_Impl_._ALL, 
  hex.log._LogLevel.LogLevel_Impl_._DEBUG, 
  hex.log._LogLevel.LogLevel_Impl_._INFO, 
  hex.log._LogLevel.LogLevel_Impl_._WARN, 
  hex.log._LogLevel.LogLevel_Impl_._ERROR, 
  hex.log._LogLevel.LogLevel_Impl_._FATAL
  ];
```

---

# Exercise 3

---

# Methods call

--

### method call
```xml
<collection id="issuesRequest" type="haxe.Http">
  <argument value="https://api.github.com/search/issues" />
  <method-call name="addParameter">
      <argument value="project"/>
      <argument value="doclerlabs/hexMachina"/>
  </method-call>
</collection>
```
Generated Haxe
```haxe
public function m_f276878bc4550514b52bbd06bac65d48() {
  var applicationContext = this._applicationAssembler.getApplicationContext("ApplicationContext", hex.runtime.basic.ApplicationContext);
  applicationContext.dispatch(hex.core.ApplicationAssemblerMessage.CONTEXT_PARSED);
  applicationContext.dispatch(hex.core.ApplicationAssemblerMessage.ASSEMBLING_START);

  var issuesRequest = new haxe.Http("https://api.github.com/search/issues");
  this.issuesRequest = issuesRequest;

  applicationContext.dispatch(hex.core.ApplicationAssemblerMessage.OBJECTS_BUILT);
  issuesRequest.addParameter("project", "doclerlabs/hexMachina");
  applicationContext.dispatch(hex.core.ApplicationAssemblerMessage.METHODS_CALLED);
  applicationContext.dispatch(hex.core.ApplicationAssemblerMessage.MODULES_INITIALIZED);
  applicationContext.dispatch(hex.core.ApplicationAssemblerMessage.ASSEMBLING_END);
}
```

--

### static call
```xml
<node id="random" type="Math" static-call="random"></node>
```
Generated Haxe
```haxe
var random = Math.random();
```

--

### factory method
```xml
<log id="logger" type="hex.log.LoggerContext" static-call="getContext" factory-method="getLogger">
  <argument value="myLogger"/>
</log>
```
Generated Haxe
```haxe
var logger = hex.log.LoggerContext.getContext().getLogger("myLogger");
```

---

# Exercise 4

---

# Flow

--

### Primitives comparison
XML
```xml
<root>
  <test id="s" value="hello"/>
  <test id="i" type="Int" value="-3"/>
  <test id="h" type="Int" value="0xFFFFFF"/>
  <test id="u" type="UInt" value="3"/>
  <test id="b" type="Bool" value="true"/>
  <test id="n" type="null"/>
</root>
```
Flow
```haxe
s = 'hello';
i = -3;
h = 0xFFFFFF;
@type( 'UInt' )
u = 3;
b = true;
n = null;
```

--

### Simple class instance 
XML
```xml
<bean id="instance" type="hex.mock.MockClassWithoutArgument"/>
```
Flow
```haxe 
instance = new hex.mock.MockClassWithoutArgument();
```

--

### Anonymous object with properties
XML
```xml
<test id="obj" type="Object">
  <property name="name" value="Francis"/>
  <property name="age" type="Int" value="44"/>
  <property name="height" type="Float" value="1.75"/>
  <property name="isWorking" type="Bool" value="true"/>
  <property name="isSleeping" type="Bool" value="false"/>
</test>
```
Flow
```haxe
obj = { name:"Francis", age:44, height:1.75, isWorking:true };
obj.isSleeping = false;
```

-- 

### method call comparison
XML
```xml
<collection id="issuesRequest" type="haxe.Http">
  <argument value="https://api.github.com/search/issues" />
  <method-call name="addParameter">
      <argument value="project"/>
      <argument value="doclerlabs/hexMachina"/>
  </method-call>
</collection>
```
Flow
```haxe
issuesRequest = new haxe.Http("https://api.github.com/search/issues");
issuesRequest.addParameter("project", "doclerlabs/hexMachina");
```

---

#  Exercice 5

---

<!--

## hexIOC

Is a super set of `hexDSL` that's include all hexMachina functonalities, like :
* `hexState` - StateMachine implementation for hexMachina
* `hexService` - Services architecture for hexMachina
* `hexMVC` - MVC implementation for hexMachina
-->