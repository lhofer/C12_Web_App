# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
    Entry.delete_all
    entries = Entry.create([
        { num_people: 1, state: "MI", electricity: 4401, natural_gas: 311, heating_oil:284, mpg:22, miles_driven:400, diet_type:"1" }
    ])
   
     DietCarbon.delete_all
     diet_carbon = DietCarbon.create([
       {diet: "meat_lover", carbon:3.3},
       {diet: "average", carbon:2.5},
       {diet: "no_beef", carbon:1.9},
       {diet: "vegetarian", carbon:1.7},
       {diet: "vegan", carbon:1.5}
    ])
   
    StateElectricity.delete_all
    state_electricities = StateElectricity.create([
         {state:"AK", carbon:1.08985},
         {state:"AL", carbon:1.13230},
         {state:"AR", carbon:1.19194},
         {state:"AZ", carbon:1.09762},
         {state:"CA", carbon:0.51331},
         {state:"CO", carbon:1.82709},
         {state:"CT", carbon:0.61930},
         {state:"DC", carbon:2.27338},
         {state:"DE", carbon:1.54460},
         {state:"FL", carbon:1.23361},
         {state:"GA", carbon:1.29223},
         {state:"HI", carbon:1.55055},
         {state:"IA", carbon:1.63346},
         {state:"ID", carbon:0.13292},
         {state:"IL", carbon:1.07827},
         {state:"IN", carbon:2.01190},
         {state:"KS", carbon:1.67188},
         {state:"KY", carbon:2.08331},
         {state:"LA", carbon:1.12327},
         {state:"MA", carbon:1.06805},
         {state:"MD", carbon:1.35793},
         {state:"ME", carbon:0.49232},
         {state:"MI", carbon:1.41178},
         {state:"MN", carbon:1.31142},
         {state:"MO", carbon:1.84360},
         {state:"MS", carbon:1.12799},
         {state:"MT", carbon:1.50352},
         {state:"NC", carbon:1.18755},
         {state:"ND", carbon:1.96531},
         {state:"NE", carbon:1.46269},
         {state:"NH", carbon:0.56226},
         {state:"NJ", carbon:0.61993},
         {state:"NM", carbon:1.81775},
         {state:"NV", carbon:1.05766},
         {state:"NY", carbon:0.63438},
         {state:"OH", carbon:1.77284},
         {state:"OK", carbon:1.48476},
         {state:"OR", carbon:0.40485},
         {state:"PA", carbon:1.17882},
         {state:"RI", carbon:0.91185},
         {state:"SC", carbon:0.88039},
         {state:"SD", carbon:0.77941},
         {state:"TN", carbon:1.14901},
         {state:"TX", carbon:1.27783},
         {state:"UT", carbon:1.83980},
         {state:"VA", carbon:1.04400},
         {state:"VT", carbon:0.00685},
         {state:"WA", carbon:0.30227},
         {state:"WI", carbon:1.56665},
         {state:"WV", carbon:1.97890},
         {state:"WY", carbon:2.10029}
    ])