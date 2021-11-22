//***********************************************
//*       Saxion First Contact Project          *
//*              ECM1V.Pf_Team_4                *
//*               version 0.009                 *
//*            authors Soma, Marvin             *
//*                                             *
//***********************************************


SceneManager scene_manager = new SceneManager();
InventoryManager inventory = new InventoryManager();

boolean debug = true;

HashMap<String, Boolean> conditions = new HashMap<String, Boolean>();


void setup(){
    //size(1920, 1080);
    fullScreen();
    frameRate(60);

    conditions.put("is_tube_broken", false);
    conditions.put("is_rat_fed", false);
    
    textSize(100);
    textAlign(CENTER);
    
    //create scenes here
    Scene main_menu = new Scene("main_menu");                                                                          //add a main_menu Scene
    
    GameObject main_menu_bg = new GameObject("main_menu_bg", width/2, height/2, 0, 0);
    main_menu_bg.SetTexture("Assets/wall_4.png");
    main_menu.AddObject(main_menu_bg);
    
    SceneChanger button_play = new SceneChanger("green_tubes", "button_play", width/2, height-400, 360, 150);
    button_play.SetTexture("Assets/button.png", 360, 150);
    main_menu.AddObject(button_play);
    
    scene_manager.AddScene(main_menu);
    
    //-----
    
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

    Collectable syringe_empty = new Collectable("syringe_empty", 200, 700, 52, 100);
    syringe_empty.SetTexture("Assets/syringe_empty.png", 52, 100);
    syringe_empty.SetHoverText("An empty syringe…");
    syringe_empty.SetCondition("is_tube_broken");
    green_tubes.AddObject(syringe_empty);

    Tube tube = new Tube("tube", 200, 700, 52, 100);
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
    cabinet_lock.SetHoverText("This drawer can only be opened by a fingerprint… Maybe I can find another way to get through the lock…");    //add hover_text for drawer/cabinet(locked)
    cabinet_lock.SetItemCondition("serum");
    door.AddObject(cabinet_lock);

    SceneChanger code_lock = new SceneChanger("win_screen", "code_lock", 780, 620, 100, 200);
    code_lock.SetHoverText("Hmm, I need to enter some sort of code here…");                                                                 //add hover_text for code_lock
    code_lock.SetCondition("is_rat_fed");
    door.AddObject(code_lock);
    
    SceneChanger glass_container_lock = new SceneChanger("glass_container", "glass_container_lock", 300, 400, 100, 100);
    door.AddObject(glass_container_lock);

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

    Collectable serum = new Collectable("serum", 700, 550, 87, 100);
    serum.SetTexture("Assets/serum.png", 87, 100);
    serum.SetHoverText("How can I pour this acid in a safe way…?");                                                      //add hover_text serum/acid
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

    Collectable hammer = new Collectable("hammer", 600, 500, 87, 100);
    hammer.SetTexture("Assets/hammer.png", 87, 100);
    hammer.SetHoverText("This definitely comes in handy!");                                                                                    //add hover_text hammer
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

    //*REMOVED* rat_food collectable to gllas_container Scene

    Collectable key = new Collectable("key", 1300, 950, 77, 100);
    key.SetTexture("Assets/key.png", 77, 100);
    key.SetHoverText("Where there’s a key there’s a lock…");                                                                                //add hover_text for key
    cabinet.AddObject(key);

    scene_manager.AddScene(cabinet);

    //----
    
    Scene cage = new Scene("cage");

    GameObject cage_bg = new GameObject("cage_bg", width/2, height/2, 0, 0);
    cage_bg.SetTexture("Assets/cage.png");
    cage_bg.SetHoverText("Looks like that rat is sitting on something…");                                                                    //add hover_text for cage(locked)
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
    
    Scene glass_container = new Scene("glass_container");                                                                                  //changes for rat_food location
    
    GameObject glass_container_bg = new GameObject("glass_container_bg", width/2, height/2, 0, 0);
    glass_container_bg.SetTexture("Assets/glass_container.png");
    glass_container.AddObject(glass_container_bg);
    
    Collectable rat_food = new Collectable("rat_food", 600, 900, 100, 64);
    rat_food.SetTexture("Assets/rat_food.png", 100, 64);
    rat_food.SetHoverText("This smells bad… Who would eat this?");                                                                              //add hover_text rat_food
    glass_container.AddObject(rat_food);
    
    SceneChanger glass_container_arrow_d = new SceneChanger("door", "glass_container_arrow_d", width/2, height-200, 70, 50);
    glass_container_arrow_d.SetTexture("Assets/arrowdown.png", 70, 50);
    glass_container.AddObject(cabinet_arrow_d);
    
    scene_manager.AddScene(glass_container);
    
    //----

    Scene win_screen = new Scene("win_screen");

    GameObject win_screen_bg = new GameObject("win_screen_bg", width/2, height/2, 0, 0);
    win_screen_bg.SetTexture("Assets/win.png");
    win_screen.AddObject(win_screen_bg);
    
    scene_manager.AddScene(win_screen);
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
