## READ ME
An in-game debug console for godot. It does one thing, and it does it well. It tracks and displays debug logs, and is dead simple to use.

its easily emplimentable into any project. 
- Bring the Debug folder to the top level of any godot project
- Add Debug.gd and DebugView.tscn to the auto load list in godot

now you're ready to start logging things in your code. 
```
## ../Example_Code.gd ...

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
