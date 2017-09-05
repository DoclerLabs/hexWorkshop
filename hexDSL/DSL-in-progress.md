# Slides raw content
compiler: `hex.compiletime.xml.BasicStaticXmlCompiler`
1. Simple Instanciation
  * Primitives
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
  * Simple class instance 
  ```xml
  <bean id="instance" type="hex.mock.MockClassWithoutArgument"/>
  ```
  ```haxe 
  var instance = new hex.mock.MockClassWithoutArgument();
  this.instance = instance;
  ```

2. Instanciation with arguments and Properties
  * with arguments
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
  ```haxe
  var d = new Date(2013, 12, 2, 12, 9, 0);
  this.d = d;
  ```

  * Anonymous object with properties
  ```xml
  <test id="obj" type="Object">
    <property name="name" value="Francis"/>
    <property name="age" type="Int" value="44"/>
    <property name="height" type="Float" value="1.75"/>
    <property name="isWorking" type="Bool" value="true"/>
    <property name="isSleeping" type="Bool" value="false"/>
  </test>
  ```
  ```haxe
  var obj = {};
  this.obj = obj;
  obj.name = "Francis";
  obj.age = 44;
  obj.height = 1.75;
  obj.isWorking = true;
  obj.isSleeping = false;
  ```

3. References
  * Array Filled With References
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
  ```haxe
  var black = 0;
  this.black = black;
  var white = 16777215;
  this.white = white;
  var red = 16711680;
  this.red = red;
  var green = 65280;
  this.green = green;
  var blue = 255;
  this.blue = blue;
  var colors = [black, white, red, green, blue];
  this.colors = colors;
  ```

  * instance with arguments references
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
  ```haxe
  var this1 = {x : 0, y : 0};
  var rectPosition = cast this1;
  this.rectPosition = rectPosition;
  cast rectPosition.x = 10;
  cast rectPosition.y = 20;
  var this2 = {x : 30, y : 40};
  var rectSize = cast this2;
  this.rectSize = rectSize;
  var rect = new DOMRect(cast rectPosition.x, cast rectPosition.y, cast rectSize.x, cast rectSize.y);
  this.rect = rect;
  ```
<!--
  * Class reference
  ```xml
  <node id="request" type="Class" value="haxe.web.Request"/>

  <node id="classContainer" type="Object">
    <property name="classReference" ref="request"/>
  </node>
  ```
  ```haxe
  public var request:Class<haxe.web.Request>;
  public var classContainer:Dynamic;
  ... 
  var request = haxe.web.Request;
  this.request = request;
  var classContainer = {};
  this.classContainer = classContainer;
  classContainer.classReference = request;
  ```
-->
  * static reference
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
  ```haxe
  // hex.log.LogLevel is abstract class
  var basicTypes = [hex.log._LogLevel.LogLevel_Impl_._ALL, hex.log._LogLevel.LogLevel_Impl_._DEBUG, hex.log._LogLevel.LogLevel_Impl_._INFO, hex.log._LogLevel.LogLevel_Impl_._WARN, hex.log._LogLevel.LogLevel_Impl_._ERROR, hex.log._LogLevel.LogLevel_Impl_._FATAL];
  coreFactory.register("basicTypes", basicTypes);
  this.basicTypes = basicTypes;
  ```

4. Methods call
  * method call
  ```xml
  <collection id="issuesRequest" type="haxe.Http">
    <argument value="https://api.github.com/search/issues" />
    <method-call name="addParameter">
        <argument value="project"/>
        <argument value="doclerlabs/hexMachina"/>
    </method-call>
  </collection>
  ```
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

  * static call
  ```xml
  <node id="random" type="Math" static-call="random"></node>
  ```
  ```haxe
  public var random:Float;
  ...
  var random = Math.random();
  this.random = random;
  ```

  * factory method
  ```xml
  <log id="logger" type="hex.log.LoggerContext" static-call="getContext" factory-method="getLogger">
    <argument value="myLogger"/>
  </log>
  ```
  ```haxe
  public var logger:hex.log.ILogger;
  ...
  var logger = hex.log.LoggerContext.getContext().getLogger("myLogger");
  this.logger = logger;
  ```
5. Flow
  * Primitives comparison
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
  ```haxe
  s = 'hello';
  i = -3;
  h = 0xFFFFFF;
  @type( 'UInt' )
  u = 3;
  b = true;
  n = null;
  ```
  * method call comparison
  ```xml
  <collection id="issuesRequest" type="haxe.Http">
    <argument value="https://api.github.com/search/issues" />
    <method-call name="addParameter">
        <argument value="project"/>
        <argument value="doclerlabs/hexMachina"/>
    </method-call>
  </collection>
  ```
  ```haxe
  issuesRequest = new haxe.Http("https://api.github.com/search/issues");
  issuesRequest.addParameter("project", "doclerlabs/hexMachina");
  ```
6. ApplicationContext Injector
  * map-type
  ```haxe 
  @map_type( 'hex.util.IStringifierStrategy' ) 
  stringifier = new hex.util.BasicStringifierStrategy();
  ```
  ```haxe
  __applicationContextInjector.mapClassNameToValue("hex.util.IStringifierStrategy", stringifier, "stringifier");
  ```
  * inject-into
  ```haxe 
  @inject_into 
  strInjected = new StringInjected();

  @map_type( 'String' ) 
  str = "one string to map";
  ```
  ```haxe
  __applicationContextInjector.mapClassNameToValue("String", str, "str");
  __applicationContextInjector.injectInto(strInjected);
  ```
7. MappingDefinition
  * MappingDefinition @Dependency()
  ```haxe
  str = "another string to map";
  mapping1 = mapping( {fromType: "String", toValue: "one string"});
  mapping2 = mapping( {fromType: "hex.util.IStringifierStrategy", toValue: new hex.util.BasicStringifierStrategy()} );

  mappings = new Array<hex.di.mapping.MappingDefinition>
  (
      mapping2,
      new hex.di.mapping.MappingDefinition( {fromType: "String", toValue: str, withName: "str"} ),
      mapping( {fromType: "todomvc.view.ITodoView", toClass: js.TodoViewJS, withName: "view", asSingleton:true} )
  );

  owner = new DependencyOwner( mapping1, mappings);
  ```
8. Runtime parameters
  ```haxe
  var code = BasicStaticFlowCompiler.compile( new ApplicationAssembler(), "configuration/context.flow" );
  code.execute( { p:{x:10, y:20} } );
  ```
  ```haxe
  @context( params = { p:{x:Int, y:Int} })
  {
      point = new hex.structures.Point( p.x, p.y );
  }
  ```
  ```haxe
  @context( params = {p:{x:Float,y:Float}} )
  {
      point = new hex.structures.Point( p.x, p.y );
  }
  ```

9. Conditional parameters


## Flow reserved features (not available in xml)
* alias
* @type

* @lazy
* @parser
* import


## sneak peek
preview - Anthony DSL IDE