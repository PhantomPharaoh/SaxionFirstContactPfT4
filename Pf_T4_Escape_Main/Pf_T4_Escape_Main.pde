//***********************************************
//*       Saxion First Contact Project          *
//*              ECM1V.Pf_Team_4                *
//*               version 0.007                 *
//*            authors Soma, Marvin             *
//*                                             *
//***********************************************


SceneManager scene_manager = new SceneManager();
InventoryManager inventory = new InventoryManager();

boolean debug = true;

HashMap<String, Boolean> conditions = new HashMap<String, Boolean>();

//-----
//Timer -> update version 0.007
int t = 0;                                //t starts with 0, this is the variable to be converted to the text
int interval = 11;                        //duration, I'm not sure about this, but every time the countdown start, it will be reduced by 1
int previous_t;                           //this variable is to compare the value of t, the scene only executes every seconds -> text me on discord, I'll explain using my voice
String time;                              //varibale to store a Sring value and will be displayed using text()
final String game_over = "GAME OVER";
boolean time_is_running = true;           //program starts > true, becomes false if t = 0;
boolean start_time = false;               //program starts > false, becomes true if mouseClicked() is called
//-----

void setup(){
    //size(1920, 1080);
    fullScreen();
    frameRate(60);

    conditions.put("is_tube_broken", false);
    conditions.put("is_rat_fed", false);
    
    textSize(100);
    textAlign(CENTER);
    
    //create scenes here
    
    Scene green_tubes = new Scene("green_tubes");
    
    GameObject green_tubes_bg = new GameObject("green_tubes_bg", width/2, height/2, 0, 0);
    green_tubes_bg.SetTexture("Assets/green_tubes.png");
    green_tubes.AddObject(green_tubes_bg);

    SceneChanger green_tubes_arrow_r = new SceneChanger("operation_bed", "green_tubes_arrow_r", width-100, height/2, 50, 70);
    green_tubes_arrow_r.SetTexture("Assets/arrowright.png", 50, 70);
    green_tubes.AddObject(green_tubes_arrow_r);

    SceneChanger green_tubes_arrow_l = new SceneChanger("desk", "green_tubes_arrow_l", 100, height/2, 50, 70);
    green_tubes_arrow_l.SetTexture("Assets/arrowleft.png", 50, 70);
    green_tubes.AddObject(green_tubes_arrow_l);

    Collectable syringe_empty = new Collectable("syringe_empty", 200, 700, 120, 120);
    syringe_empty.SetTexture("Assets/syringe_empty.png", 120, 120);
    syringe_empty.SetCondition("is_tube_broken");
    green_tubes.AddObject(syringe_empty);

    Tube tube = new Tube("tube", 200, 700, 120, 120);
    tube.SetItemCondition("hammer");
    green_tubes.AddObject(tube);

    scene_manager.AddScene(green_tubes);

    //-----

    Scene operation_bed = new Scene("operation_bed");
    
    GameObject operation_bed_bg = new GameObject("operation_bed_bg", width/2, height/2, 0, 0);
    operation_bed_bg.SetTexture("Assets/operation_bed.png");
    operation_bed.AddObject(operation_bed_bg);

    SceneChanger operation_bed_arrow_r = new SceneChanger("door", "operation_bed_arrow_r", width-100, height/2, 50, 70);
    operation_bed_arrow_r.SetTexture("Assets/arrowright.png", 50, 70);
    operation_bed.AddObject(operation_bed_arrow_r);

    SceneChanger operation_bed_arrow_l = new SceneChanger("green_tubes", "operation_bed_arrow_l", 100, height/2, 50, 70);
    operation_bed_arrow_l.SetTexture("Assets/arrowleft.png", 50, 70);
    operation_bed.AddObject(operation_bed_arrow_l);

    SceneChanger to_tools = new SceneChanger("operation_tools", "to_tools", 800, 800, 500, 300);
    operation_bed.AddObject(to_tools);

    scene_manager.AddScene(operation_bed);

    //-----

    Scene door = new Scene("door");
    
    GameObject door_bg = new GameObject("door_bg", width/2, height/2, 0, 0);
    door_bg.SetTexture("Assets/door.png");
    door.AddObject(door_bg);

    SceneChanger door_arrow_r = new SceneChanger("desk", "door_arrow_r", width-100, height/2, 50, 70);
    door_arrow_r.SetTexture("Assets/arrowright.png", 50, 70);
    door.AddObject(door_arrow_r);

    SceneChanger door_arrow_l = new SceneChanger("operation_bed", "door_arrow_l", 100, height/2, 50, 70);
    door_arrow_l.SetTexture("Assets/arrowleft.png", 50, 70);
    door.AddObject(door_arrow_l);

    SceneChanger cabinet_lock = new SceneChanger("cabinet", "cabinet_lock", 1600, 870, 200, 200);
    cabinet_lock.SetItemCondition("serum");
    door.AddObject(cabinet_lock);

    SceneChanger code_lock = new SceneChanger("win_screen", "code_lock", 780, 620, 100, 200);
    code_lock.SetCondition("is_rat_fed");
    door.AddObject(code_lock);

    scene_manager.AddScene(door);

    //-----

    Scene desk = new Scene("desk");
    
    GameObject desk_bg = new GameObject("desk_bg", width/2, height/2, 0, 0);
    desk_bg.SetTexture("Assets/desk.png");
    desk.AddObject(desk_bg);

    SceneChanger desk_arrow_r = new SceneChanger("green_tubes", "desk_arrow_r", width-100, height/2, 50, 70);
    desk_arrow_r.SetTexture("Assets/arrowright.png", 50, 70);
    desk.AddObject(desk_arrow_r);

    SceneChanger desk_arrow_l = new SceneChanger("door", "desk_arrow_l", 100, height/2, 50, 70);
    desk_arrow_l.SetTexture("Assets/arrowleft.png", 50, 70);
    desk.AddObject(desk_arrow_l);

    Collectable serum = new Collectable("serum", 700, 550, 150, 150);
    serum.SetTexture("Assets/serum.png", 150, 150);
    serum.SetItemTexture("Assets/syringe_filled.png");
    serum.SetItemCondition("syringe_empty");
    desk.AddObject(serum);

    SceneChanger cage_lock = new SceneChanger("cage", "cage_lock", 250, 500, 200, 200);
    cage_lock.SetItemCondition("key");
    desk.AddObject(cage_lock);

    scene_manager.AddScene(desk);

    //----

    Scene operation_tools = new Scene("operation_tools");

    GameObject operation_tools_bg = new GameObject("operation_tools_bg", width/2, height/2, 0, 0);
    operation_tools_bg.SetTexture("Assets/operation_tools.png");
    operation_tools.AddObject(operation_tools_bg);

    SceneChanger operation_tools_arrow_d = new SceneChanger("operation_bed", "operation_tools_arrow_d", width/2, height-200, 70, 50);
    operation_tools_arrow_d.SetTexture("Assets/arrowdown.png", 70, 50);
    operation_tools.AddObject(operation_tools_arrow_d);

    Collectable hammer = new Collectable("hammer", 600, 500, 150, 150);
    hammer.SetTexture("Assets/hammer.png", 150, 150);
    operation_tools.AddObject(hammer);

    scene_manager.AddScene(operation_tools);

    //----

    Scene cabinet = new Scene("cabinet");

    GameObject cabinet_bg = new GameObject("cabinet_bg", width/2, height/2, 0, 0);
    cabinet_bg.SetTexture("Assets/cabinet.png");
    cabinet.AddObject(cabinet_bg);

    SceneChanger cabinet_arrow_d = new SceneChanger("door", "cabinet_arrow_d", width/2, height-200, 70, 50);
    cabinet_arrow_d.SetTexture("Assets/arrowdown.png", 70, 50);
    cabinet.AddObject(cabinet_arrow_d);

    Collectable rat_food = new Collectable("rat_food", 600, 900, 300, 200);
    rat_food.SetTexture("Assets/rat_food.png", 300, 200);
    cabinet.AddObject(rat_food);

    Collectable key = new Collectable("key", 1300, 950, 100, 100);
    key.SetTexture("Assets/key.png", 100, 100);
    cabinet.AddObject(key);

    scene_manager.AddScene(cabinet);

    //----
    
    Scene cage = new Scene("cage");

    GameObject cage_bg = new GameObject("cage_bg", width/2, height/2, 0, 0);
    cage_bg.SetTexture("Assets/cage.png");
    cage.AddObject(cage_bg);

    SceneChanger cage_arrow_d = new SceneChanger("desk", "cage_arrow_d", width/2, height-200, 70, 50);
    cage_arrow_d.SetTexture("Assets/arrowdown.png", 70, 50);
    cage.AddObject(cage_arrow_d);

    Rat rat = new Rat("rat", 700, 720, 150, 150);
    rat.SetTexture("Assets/rat.png", 150, 150);
    rat.SetItemCondition("rat_food");
    cage.AddObject(rat);

    scene_manager.AddScene(cage);

    //----

    Scene win_screen = new Scene("win_screen");

    GameObject win_screen_bg = new GameObject("win_screen_bg", width/2, height/2, 0, 0);
    win_screen_bg.SetTexture("Assets/win.png");
    win_screen.AddObject(win_screen_bg);

    scene_manager.AddScene(win_screen);



}

void draw(){
 
    t = interval;  
  
    if (time_is_running & start_time == true) {     
      
      t = interval - int(millis()/1000);            //countdown starts if mouse is clicked and time is running
      
      if (previous_t != t) {                        //program only executes if previous_t value IS NOT the same with the value of t
        scene_manager.GetCurrentScene().Update();
        inventory.DrawInventory();
      }
      previous_t = t;
      
      time = nf(t, 3);                              //nf -> changes numeric values to String
    
      if (t == 0) {                                 //if time is 0, start_time becomes false, so the countdown will stop
        start_time = false;
        time_is_running = false;
        time = game_over;                           //change the numeric text to 'GAME OVER' text
      }
    
      text(time, width/2, 100);
    }    
}

void mouseMoved() {
}

void mousePressed() {
    if (!inventory.IsInventoryClick()){
        scene_manager.GetCurrentScene().Clicked();
    }
}

void mouseClicked() {
    start_time = true;                              //program starts = false > mouse is clicked > value changes to true
}
