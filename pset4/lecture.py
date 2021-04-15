#to run this you type python3 lecture.py
#to stop this from running you hit control c

# imports
from flask import Flask, render_template, redirect, request
from flaskext.mysql import MySQL



# web application
app = Flask(__name__)

# connect to db- API connection lines are 18 and 19, 14-17 are configuration
app.config['MYSQL_DATABASE_USER'] = 'root'
app.config['MYSQL_DATABASE_PASSWORD'] = 'MikStrech1113.'
app.config['MYSQL_DATABASE_DB'] = 'education'
app.config['MYSQL_DATABASE_HOST'] = 'localhost'
mysql = MySQL()
mysql.init_app(app)

@app.route('/')
def index():
    return redirect('/read') #???how does it know this is my read html doc- this is working through the browser

@app.route('/read')
def read():
    cursor = mysql.get_db().cursor()
    response = cursor.execute("Select B.ISBN, B.book_name, A.Name, P.Name, E.Name, B.price, B.genre from Book B join Author A on B.author_id = A.author_id join Publisher P on B.publisher_id = P.publisher_id join Editor E on B.editor_id = E.editor_id")
    html = ''    
    if response > 0:
        books = cursor.fetchall()
        return render_template('read.html', book_list=books) #???i cant figure out how this list function is supposed to work

@app.route('/author')
def author():
    cursor = mysql.get_db().cursor()
    response = cursor.execute("SELECT * FROM Author")
    html = ''    
    if response > 0:
        authors = cursor.fetchall()
        return render_template('author.html', author_list=authors) 



# @app.route('/other_read')
# def other_read():
#     cursor = mysql.get_db().cursor()
#     response = cursor.execute("SELECT * FROM Booked")
#     html = ''    
#     if response > 0:
#         books = cursor.fetchall()
#         return render_template('other_read.html', book_list=books)

@app.route('/books') 
def books():   #this is not putting it into a table its simply reading out the list of books
    cursor = mysql.get_db().cursor() #this provides the cursor in mysql querry
    response = cursor.execute("SELECT * FROM Book") #this is the SQL querry i am sending to my db
    html = ''   #this is just looking at what the response is from the query
    if response > 0: #if response greater than 0 then fetchall
        books = cursor.fetchall()
        for book in books:    #within the return for loop over the books with a break between each
            html += book[1] + '<br/>' #this is taking the first column which is book title
        return html


@app.route('/delete')
def delete():
    id = request.args.get('id')
    print("deleting ISBN part 1", id)
    return render_template('delete.html', ISBN=id) 
@app.route('/delete/confirm', methods = ['POST'])
def delete_confirm():
    delete_data = request.form
    ISBN = delete_data['ISBN']
    cur = mysql.get_db().cursor()  #this is just part of the API call to make the call to your db work- this is boilerplate code
    cur.execute( "Delete From Orders Where ISBN=%s", ISBN)
    cur.execute( "Delete From Book Where ISBN=%s", ISBN) 
    mysql.get_db().commit()
    print("deleting ISBN part 2", ISBN)
    return redirect('/read') 



@app.route('/edit')
def edit():
    id = request.args.get('id')
    print("update book part 1", id)
    cursor = mysql.get_db().cursor()
    response = cursor.execute("SELECT * FROM Author")
    html = ''    
    if response > 0:
        authors = cursor.fetchall()
        return render_template('update.html', ISBN=id, authors=authors) 
@app.route('/edit/confirm', methods = ['POST'])
def edit_confirm():
    edit_data = request.form
    ISBN = edit_data['ISBN']
    cur = mysql.get_db().cursor() 
    cur.execute( "Update Book SET ISBN=%s", ISBN) 
    mysql.get_db().commit()
    print("Editing ISBN part 2", ISBN)
    return redirect('/read') 
    
@app.route('/update', methods=['POST'])
def update():
    author = request.form
    id = author['author_id']
    name = author['Name']
    cur = mysql.get_db().cursor()
    cur.execute("UPDATE Author SET Name=%s WHERE author_id=%s",(name, id))
    mysql.get_db().commit()
    return redirect('/author')   


@app.route('/edit_author')
def edit_author():
    id = request.args.get('author_id')
    cursor = mysql.get_db().cursor()
    response = cursor.execute("SELECT * FROM Author")
    html = ''    
    if response > 0:
        authors = cursor.fetchall()
        return render_template('author_update.html', author_id=id, Name=authors) 
@app.route('/author_edit/confirm', methods = ['POST'])
def author_edit_confirm():
    edit_author = request.form
    a_name = edit_author['Name']
    author_id= edit_author['author_id']
    cur = mysql.get_db().cursor() 
    cur.execute("UPDATE Author A SET A.Name=%s WHERE author_id=%s",(a_name, author_id))    
    mysql.get_db().commit()
    return redirect('/author') 
    
    
    # edit = {}
    # edit['ISBN'] = request.args.get('id')
    # edit['book_name'] = request.args.get('book_name')  
    # edit['price'] =  request.args.get('[price]')
    # return render_template('update.html', book_list=books)

#if i want to now refrence a different python doc such as delete- how can i pull that in
#I want to use delete.py here to simplify my code
#also in the buttons example why does everything have its own route?
#i just want the ability to delete within my table then have it route me to the delete page

#why do you have /createform and then below you are creating another /create
@app.route('/createForm')
def create():
    return render_template('/create.html')

@app.route('/create', methods=['POST'])
def add():
    create_data = request.form
    ISBN = create_data['ISBN']
    name = create_data['book_name']
    price = create_data['price']
    # genre = create_data['genre']
    cur = mysql.get_db().cursor()
    cur.execute("INSERT INTO Booked(book_name, ISBN, price) VALUES(%s, %s, %s)",(name, ISBN, price))
    mysql.get_db().commit()
    return redirect('/other_read')

@app.route('/create_author_form')
def create_author():
    return render_template('/create_author.html')
@app.route('/create_author', methods=['POST'])
def add_author():
    author = request.form
    author_id = author['author_id']
    Name = author['Name']
    num_pub_books = author['num_pub_books']
    cur = mysql.get_db().cursor()
    cur.execute("INSERT INTO Author(author_id, Name, num_pub_books) VALUES(%s, %s, %s)",(author_id, Name, num_pub_books))
    mysql.get_db().commit()
    return redirect('/author')



if __name__ == '__main__':
    app.run(debug=True)