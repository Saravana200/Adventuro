
import pandas as pd
import json

# Load the CSV files
city_df = pd.read_csv('City.csv')
places_df = pd.read_csv('Places.csv')

# Initialize the output data structure
output_data = {"intents": []}

# Loop through each city in the City.csv file
for city in city_df['City'].unique():
    # Selecting places for the current city from Places.csv
    places = places_df[places_df['City'] == city]

    # Patterns (queries) about the city
    patterns = [
        f"I want to go to {city}",
        city,
        f"Suggest Places in {city}",
        f"I love {city}",
        f"{city} famous places",
        f"{city} places"
    ]

    # Extracting city information including ratings and best time to visit
    city_info = city_df[city_df['City'] == city].iloc[0]
    city_description = city_info['City_desc']
    ratings = f"Ratings: {city_info['Ratings']}"
    best_time_to_visit = f"Best time to visit: {city_info['Best_time_to_visit']}"

    # Responses about the city
    places_descriptions = places['Place_desc'].tolist()
    responses = [city_description, ratings, best_time_to_visit] + places_descriptions

    # Adding the city data to the output with additional fields
    output_data["intents"].append({
        "tag": city,
        "patterns": patterns,
        "responses": responses
    })

# Convert the output data to JSON format
output_json = json.dumps(output_data, indent=4)

# Save the JSON data to a file
output_file_path = 'processed_intents2.json'
with open(output_file_path, 'w') as file:
    file.write(output_json)

print(f"Data processed and saved to {output_file_path}")
