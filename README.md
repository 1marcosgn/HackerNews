# HackerNews

Mobile app that displays stories from Hacker News.

- Tapping a story should open a web browser if the story is an external link.
- Tapping a story should open a new view in the app displaying the story content if it is not an
external link.
- Added Unit tests
- Added UI tests

### "News Object" Structure
```
{
	"source": {
		"id": "the-new-york-times",
		"name": "The New York Times"
	},
	"author": null,
	"title": "St. Louis Officer Charged in Fatal Russian Roulette Shooting of Another Officer, Authorities Say - The New York Times",
	"description": "Officer Nathaniel Hendren was charged with involuntary manslaughter after the authorities said he fatally shot another officer, Katlyn Alix.",
	"url": "https://www.nytimes.com/2019/01/26/us/st-louis-police-russian-roulette.html",
	"urlToImage": "https://static01.nyt.com/images/2019/01/27/us/27xp-roulette/27xp-roulette-facebookJumbo.jpg",
	"publishedAt": "2019-01-26T18:12:55Z",
	"content": "On Friday, Kimberly M. Gardner, the St. Louis circuit attorney, said her office had evidence to file charges. We lost a shining star and a dedicated public servant, Ms. Gardner said in a statement, adding that an investigation was continuing. I have said this… [+616 chars]"
}
```

### Screenshots

| Main Table View | Detail View |
| --- | --- |
| ![screen shot 2019-01-26 at 2 19 15 pm](https://user-images.githubusercontent.com/6865674/51793511-58bab780-2176-11e9-9ca9-cfc1cb8691fd.png) | ![screen shot 2019-01-26 at 2 19 35 pm](https://user-images.githubusercontent.com/6865674/51793514-63754c80-2176-11e9-8e62-5a66d043f163.png) |

