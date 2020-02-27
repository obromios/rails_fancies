# Rails Fancies

## Introduction
Rails Fancies is an open source project to develop some fanciful Ruby on Rails helpers.  Most rails helpers tend to be tightly focused on placing a single element on a page, like a link or an image tag.  Rails Fancies is for helpers that are more complex and can form the basis of complete a web page. 

## FAQ Helper
This is a helper to write a FAQ helper. You can arrange the questions and answer separately and click through to from the question to the corresponding answer.

## Install
```
gem 'rails_fancies'
```
and then bundle.
## Requirements
```
Rails 4
```


## How to Use FAQ Helper
In your gemfile, include


Here is an example of how to use the FAQ helper
```
<%= fancy_faq do |f| %>
	<h2>Questions</h2>
	<%= f.question :first, 'Is this the first question?' %>
	<%= f.question :second, 'Is this the second question?' %>
	<h2>Answers</h2>
	<%= f.answer :first, 'Yes it is the answer to the first question, and let me add that it is a very good question indeed.' %>
	<%= f.answer :second, 'Yes this is the answer to the second question, and I now find the answer and the question repetitive. ' %>
<% end -%>
```
So to ask a question, just enter
```
f.question question_tag, question_text
where question_tag is a unique symbol for that question, and question_text is a string containing the actual question.
```
To answer the question, just enter
```
f.answer, question_tag, answer_text where answer_text is a string containing the answer to the question.
```
You can intersperse other text and html element (like h2 tags) between the questions and answers.

## Contributing to Rails Fancies
If you have an idea for a new type of rails fancy, then either open an issue for your idea or do a pull request.

If you find a bug or have difficulties getting the helpers to work, then please raise an issue.



