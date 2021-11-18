//***********************************************
//*       Saxion First Contact Project          *
//*              ECM1V.Pf_Team_4                *
//*               version 0.005                 *
//*            authors Soma, Marvin             *
//*                                             *
//***********************************************


SceneManager scene_manager = new SceneManager();
InventoryManager inventory = new InventoryManager();

boolean debug = false;

HashMap<String, Boolean> conditions = new HashMap<String, Boolean>();

void setup(){
    //size(1920, 1080);
    fullScreen();
    frameRate(60);

    conditions.put("is_tube_broken", false);

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









    
}

void draw(){
    scene_manager.GetCurrentScene().Update();
    inventory.DrawInventory();
}

void mouseMoved() {
}

void mousePressed() {
    if (!inventory.IsInventoryClick()){
        scene_manager.GetCurrentScene().Clicked();
    }
}