# final-project-eBook
eBook App 


# Project Description :
“eBook App” is a Swift application, is a collection of Arabic and English book libraries, contains many  books for adults and children, designed to help users read books anywhere and any time easily.

### Features List:

- User can read books in his preferred language.
- User can share his favorite Book with his frinds.
- User can choose his books favorite list.
- User can Change the App Language (Arabic & English).
- User can share the App with friends.
- The application serve adults and children.

# Structure:
// Add your project screens/models/views/cells
screens:
- HomeVC.
- ArabicBookVC.
- EnglishBookVC.
- FavoriteVC.
- profileVC.
- pdfBookVC
Models:
- User
- BookData
Cells:
- ArabicCell
- EnglishCell
- Favourite Cell
- BookInformationCell
- ReadBook Cells


# User Stories:
- As a User  I want  to Login/Register, So that I can creat account in the app .

- As a User  I want  to SignOut, So that I can logout and login with another account.

- As a User  I want  to Edit my profile, So that I can update my name and profile image.

- As a User  I want  to Choose book Language, So that I can read it  with my language.

- As a User I want to See my favourite List , So that I can find my favourite book quickly and easily.

- As a User  I want  to Add/Remove books from favourite list, So that I can  control  my favourite list .

- As a User I want to Share the book , So that I can share it with my friends.

- As a User I want to Chanage App Langauge , So that I can use it with my understandable langauge.

- As a User I want to read adult/children Books , So that I can read books that are suitable for my age.


# Backlog:
 
User :
- see your profile
- see English & Arabic Book List
- see favourite book list
- can read Book
- can signOut


# React Router Routes (React App)

|      Component      |   Permission   |                Behavior                  |
|       :---          |     :---:      |                  ---:                    |
|     lunchScreen     |     public     |                Show Logo                 |
|       :---          |     :---:      |                  ---:                    |
|    RigesterPage     |     public     |  Rigester page, link to login,           | 
|                     |                |  navigate to homepage after Rigester.    |  
|       :---          |     :---:      |                  ---:                    |
|                     |                |      Login page, link to Rigester,       |
|     LoginPage       |     public     |      navigate to home page after login.  |
|                     |                |                                          |
|       :---          |     :---:      |                  ---:                    |
|                     |                | Home page, link to Arabic Books List,    |
|    firstHomePage    |   user only    | navigate to Arabic Books List after      |
|                     |                |     pressed on Arabic button.            |
|       :---          |     :---:      |                  ---:                    |
|                     |                | Home page, link to English Books List,   |
|    firstHomePage    |   user only    | navigate to English Books List after     |
|                     |                |     pressed on English button.           |
|       :---          |     :---:      |                  ---:                    |
|                     |                | list Book page, link to Book information,|
|    listBookPage     |   user only    |     navigate to Book information         |
|                     |                |    after pressed on specific Book.       |
|        :---         |     :---:      |                  ---:                    |
|                     |                |                                          |
|                     |                | information Book page, link to read Book,|
| informationBookPage |   user only    |  navigate to Book PDF after pressed      |
|                     |                |    on Read Book Button.                  |
|       :---          |     :---:      |                  ---:                    |
|                     |                |                                          |
|                     |                | information Book page, link to share     |
| informationBookPage |   user only    | Book, navigate to Alert sheet after      |
|                     |                |   pressed on Share Book Button.          |
|       :---          |     :---:      |                  ---:                    |
|                     |                |                                          |
|                     |                |    list Book Page, link to add book to   |
|    listBookPage     |   user only    |    favourite page, after pressed         |
|                     |                |         on heart Button.                 |
|       :---          |     :---:      |                  ---:                    |
|                     |                |                                          |
|                     |                | favourite Book Page, link to raed        |
|  favouriteBookPage  |   user only    |    favourite book, after pressed         |
|                     |                |         on specific Book.                |
|       :---          |     :---:      |                  ---:                    |
|                     |                |                                          |
|                     |                | cildren page, link to Arabic Books List, |
|    cildrenPage      |   user only    | navigate to Arabic Books List after      |
|                     |                |     pressed on Arabic button.            |
|       :---          |     :---:      |                  ---:                    |
|                     |                | cildren page, link to English Books List,|
|    cildrenPage      |   user only    | navigate to English Books List after     |
|                     |                |     pressed on English button.           |
|       :---          |     :---:      |                  ---:                    |
|                     |                | profile page, link to edit profile image,| 
|    profilePage      |   user only    | navigate to iphone library               |
|                     |                |  after tap on profile image.             |
|       :---          |     :---:      |                  ---:                    |
|                     |                | profile page, link to edit User name,    | 
|    profilePage      |   user only    | navigate to edite user name after        |
|                     |                |  tap on name field.                      |
|       :---          |     :---:      |                  ---:                    |
|                     |                | profile page, link to change language,   | 
|    profilePage      |   user only    | navigate to iphone setting               |
|                     |                |  after tap on change Language button.    |
|                     |                |                                          |
|       :---          |     :---:      |                  ---:                    |
|                     |                | profile page, link to share Application, | 
|    profilePage      |   user only    | navigate to share Alert sheet after      |
|                     |                |  pressed on Share App button.            |
|       :---          |     :---:      |                  ---:                    |
|                     |                | profile page, link to signOut,           | 
|    profilePage      |   user only    | navigate to login page after             |
|                     |                |  pressed on SignOut button.              |
|       :---          |     :---:      |                  ---:                    |

# Components:

 - Rigester $ LogIn Page 
 - Home Page (contains collection of pages)
 - Cildren Page (contains collection of pages)
 - Favourite Page
 - Profile Page
 
 # Services
_ Auth Service: 
  - auth.rigester(user)
  - auth.login(user)
  - auth.logout(user)
_ Favourite Services.

# Links: 

_ repository Link:
https://github.com/AfnanKhalid22/final-project-eBook

-
  





|      Component      |   Permission   |                Behavior                  |
|                     |                |                                          |
|     lunchScreen     |     public     |                Show Logo                 |
|       :---          |     :---:      |                  ---:                    |
|    RigesterPage     |     public     |  Rigester page, link to login,           | 
                                         navigate to homepage after Rigester.     
|                     |                |
