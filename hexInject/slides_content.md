# hexInject

---

![diagram](resource/schema-inject.png) <!-- .element: style="border: 0; background: None; box-shadow: None; max-height:640px" -->

---

# Introduction

## Dependency injection
 - Dependency = Object that can be used
 - Injection = Passing the dependency to an object that would use it  
 - Supports the dependency inversion principle
 
---

### Why?
 - Managing dependencies yourself is ...
   - ... tying you only to one specific implementation
   - ... forcing you to gather and pass around dependencies of given object

---

### How to solve it? - Depency injector
 - What it is?
   - It's an object which holds objects for you and provides them when requested
 - How does it work?
   - Set of rules/instances
   - Two sides of dependency

--

## Map

 - `injector.map(X).toY(Z);`
   - = "When something asks for X, provide back instance of Z based on the rule Y."

 - `injector.map(ISomething).toSingleton(MyClass);` <!-- .element: class="fragment" -->

--

## Get

 - `injector.getInstance(X);`
   - = "Give me X."

---

# What are you going to learn

 - How to map things and what rules you can create in injector
   - Create own rules
 - How to request stuff from injector
   - Direct call
   - Annotation
 - Lifecycle of a managed instance

---

# Mapping dependencies

--

### Value mapping

 - `injector.map(X)`
   - `.toValue(x)` 
     - "When something requires X return following specific value x" 
     - [+] Good when you already have instance constructed and you want everyone to have that instance 
	 - [-] Constructing instance yourself might be bad idea

--

### Singleton mapping

 - `injector.map(X)`
   - `.toSingleton(X)` 
     - Essentially the same thing as value mapping but you don't construct the instance yourself 
	 - [+] Instance is constructed lazily
	 - [-] Instance is constructed lazily

--

### Type mapping

 - `injector.map(X)`
   - `.toType(X)` 
     - With every request new instance of X gets created 
	 - = Factory

--

### Mapping by name

 - `injector.map(X, "name")`
   - Often you need to operate with multiple singleton  (=multiton) or factories producing the same type 
   - Good practice is to use constants for names for quick refactoring

--

### Removing mapping

 - `injector.unmap(X)` 
   - Removes mapping and destroys provider

---

# Exercise 1

File: **MappingExercise.hx**

### Cheat sheet

 - `injector.map(X)` - creates mapping
 - `injector.map(X, "name")` - creates mapping with name
   - `.toValue(x)` - specific value `x`
   - `.toSingleton(X)` - singleton of `X`
   - `.toType(X)` - new instance of `X` every time
 - `injector.unmap(X)` - removes mapping

--

![rick_and_morty](resource/rick_and_morty.jpg) <!-- .element: style="border: 0; background: None; box-shadow: None; max-height:640px" -->

---

# Dependency providers

 - "Rules" that maintain and "provide dependencies" to the injector
 - For example `.toSingleton` will under the hood create a *Singleton provider* which actually holds the single instance

--

### Provider mapping

 - `injector.map(X).toProvider(<IDependencyProvider>)`
   - Provides the power of supplying your own provider and manipulating instances yourself without exposing any logic to the outside world
   - You have to provide an instance of a `IDependencyProvider<T>`

--

### `IDependencyProvider<T>` interface

 - `getResult(injector:IDependencyInjector, target:Class<Dynamic>):T;`
   - called when injector is being requested for a dependency
   - function arguments:
     - `injector`
	   - the injector which is trying to satisfy the dependency
     - `target`
	   - the class (not instance because instance might not exist yet) that requires given dependency

--

### `IDependencyProvider<T>` interface

 - `destroy():Void;`
   - called when `injector.unmap()` is called

---

# Exercise 1_1

File: **MappingExercise_1.hx**

### Cheat sheet

 - `injector.map(X)`
   - `.toProvider(<instance of MyProvider>)`

```haxe
class MyProvider implements IDependencyProvider<MyClass>
{

	public function getResult(
		injector:IDependencyInjector,
		target:Class<Dynamic>
	):MyClass
	{
		return new MyClass();
	}
	
	public function destroy():Void 
	{
	}
}
```

---

## Mapping dependencies footnotes
### Different methods providing other possibilities

--

### Single method calls
 - `injector.mapToClass(...);`
 - `injector.mapToType(...);`
 - `injector.mapToValue(...);`

--

### Mapping by class name

 - `injector.mapClassName(<String>).to...`
   - You can map everything but you have to provide fully qualified type as string

--

### Using `InjectorUtil`

 - `using hex.di.util.InjectorUtil;`
 
 - `injector.mapDependency(new Dependency<T>()).to...` 
   - Macro driven syntactic sugar for the above

---

# Getting dependencies

## Direct request

--

### Requesting instance

 - `injector.getInstance(X);`
   - Most common
   - If mapping is missing a runtime exception is thrown
   - Optionally with a name `.getInstance(X, "name");`

--

### Requesting instance regardless of mapping

 - `injector.instantiateUnmapped(X);`
   - Useful when you want to create a new instance of something that has dependencies and you either know that it isn't mapped or you want to ignore the existing mapping

--

### Safe way to always have an instance

 - `injector.getOrCreateNewInstance(X);`
   - Useful when you don't know/care whether or not injector has mapping for a given type but you need to be sure you have an instance of a given type
   - Basically `injector.satisfies(X) ? injector.getInstance(X) : injector.instantiateUnmapped(X)`

--

### Injecting into existing instance

 - `injector.injectInto(x);`
   - Usually not used directly but useful when you already have instance which has some dependencies

---

# Exercise 2

File: **InjectingExercise.hx**

### Cheat sheet

 - `injector.getInstance(X);` - gets instances if it's mapped
 - `injector.instantiateUnmapped(X);` - gets instantce regardless of mapping
 - `injector.getOrCreateNewInstance(X);` - either gets instance or makes a new one
 - `injector.injectInto(x);` - injects into instance

---

# Getting dependencies

## Automagic requests using annotations

--

### Standard annotation format

 - `@Inject public var x:X;`
   - Optionally can contain a name `@Inject("name")`

 - `@Optional(true)`
   - If instance is not necessary
   - Doesn't throw exception if instance is missing
   - Doesn't do assignment (but does method call)

--

### Supported injection points

 - constructor 
```haxe
@Inject public function new(myDependency:SomeClass) {}
```
 - public variable
```haxe
@Inject public var myDependency:SomeClass;
```
 - public function
```haxe
@Inject public function satisfy(myDependency:SomeClass):Void {}
```
   - *note*: function is always called
     - if injection is optional and a mapping is missing function is called with a null value
 - setter
 ```haxe
@Inject public var myDependency(default, set):SomeClass;
function set_myDependency(myDependency:SomeClass):Void {}
```

--

## IInjectionContainer

 - "Magic interface" for internal reflection system
 - Must be implemented

---

# Exercise 3

File: **all files in exercise3 packages**

### Cheat sheet

 * `implements IInjectorContainer`
<br />
<br />
 * `@Inject`
 * `@Inject("name")`
 * `@Optional`

<br />

### Metadata examples

```haxe
@Inject public var myDependency:SomeClass;
@Inject public function satisfy(myDependency:SomeClass):Void {}
@Inject public function new(myDependency:SomeClass) {}
```

---

# Lifecycle of an instance

--

### Handling creation

 - `@PostConstruct`
   - Annotation for any method
   - Called automatically as a last thing when all dependencies are satisfied
   - *note*: This method is called every time when dependencies are satisfied
     - (calling Injector.injectInto(x) twice will invoke the PostConstruct method twice)

--

### Handling destruction

 - `@PreDestroy`
   - Annotation for any method
   - Called automatically when `injector.unmap(X)`

---

# Exercise 4

File: **all files in exercise4 packages**

### Cheat sheet

 - `@PostConstruct`
 - `@PreDestroy`

---

# Mapping definitions

 - `hex.di.mapping.MappingDefinition`
 - Typedef that represents a mapping
 - Standardized way to pass around rules for injector without any the injector

--

## Mapping definition structure

```haxe
typedef MappingDefinition =
{
	var fromType                : String;
	@:optional var withName     : String;
	
	@:optional var toClass      : Class<Dynamic>;
	@:optional var toValue      : Any;
	
	@:optional var asSingleton  : Bool;
	@:optional var injectInto   : Bool;
}
```

--

 - `fromType`
   - = `injector.map([fromType])`
 - `withName`
   - = `injector.map([fromType], [withName])`
 - `toClass`
   - = `injector.map([fromType], [withName]).toClass([toClass])`
 - `toValue`
   - = `injector.map([fromType], [withName]).toValue([toValue])`
 - `asSingleton`
   - = `injector.map([fromType], [withName]).toSingleton([toClass])`
 - `injectInto`
   - useful only for `toValue`
   - the target injector will `injectInto` the instance

--

### Mapping definitions

**Pros**:
 - No need for injector to create definitions
 - Easy to pass around
 - Automatic mapping things can be automated and verified

**Cons**:
 - Not everything can be done using `MappingDefinition`
 - `fromType` type is represented as string

---

# Exercise 5

File: **MappingDefinitionExercise.hx**

### Cheat sheet

```haxe
typedef MappingDefinition =
{
	var fromType                : String;
	@:optional var withName     : String;
	
	@:optional var toClass      : Class<Dynamic>;
	@:optional var toValue      : Any;
	
	@:optional var asSingleton  : Bool;
	@:optional var injectInto   : Bool;
}
```
