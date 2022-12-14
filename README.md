## READ ME
An in-game debug console for godot. It does one thing, and it does it well. It tracks and displays debug logs, and is dead simple to use.

its easily emplimentable into any project. 
- Bring the Debug folder to the top level of any godot project
- Add Debug.gd and DebugView.tscn to the auto load list in godot
![[Screenshot from 2022-12-13 07-48-53.png]] ![[Screenshot from 2022-12-13 07-47-05.png | 480]]

now you're ready to start logging things in your code. 
```
## ../Example_Code.gd
...

var debug : Debug.Data              # allocate debug data instance

### var debug = Debug.New("id")     # Does NOT currently work when run 
									# outside a function or in _init_

func ready():
	debug = Debug.New("Example Bug")       # instance debug data object
	debug.Log("_ready()", "Hello World")   # create a log in our debug object

...
```
note the uppercase 'N' in `Debug.New("")`, this function is not the same as `Debug.new()`. 

The debug ui will be shown by default when running a scene. Pressing `BACKSPACE` will toggle the debug ui on and off. To change the size of the debug panel click and drag at the edge of the panel.

Simple example code
![[Screenshot from 2022-12-12 22-08-14.png]]
by calling `debug.Log` in `_process()` we create a field for process which updates the number of times that process function is called, and a field for fps which updates similarly

![[Screenshot from 2022-12-13 11-14-29.png]]

It is possible to have multiple Debug.Data objects in your code. Here we create an array of Data objects, assign an id based on their index, then generate a set of logs in each of those Data objects. This is a more complex and somewhat convoluted example. In this code on `_ready()` we create a bunch of data objects and populate them with random logs. This is a less practicle example, primarily to show how the collection of debug data is displayed.
![[Screenshot from 2022-12-12 22-10-29.png]]
![[Screenshot from 2022-12-13 11-13-30.png]]
