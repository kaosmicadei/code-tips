def count_words(words):
    bucket = {}
    for word in words:
        bucket[word] = bucket.setdefault(word, 0) + 1
    return bucket

def reducer(chunks):
    bucket = {}
    for result in chunks:
        for word, partial_count in result.items():
            bucket[word] = bucket.setdefault(word, 0) + partial_count
    return bucket

text = "mapreduce is a programming model and an associated implementation for processing and generating bigdata sets with a parallel distributed algorithm on a cluster a mapreduce program is composed of a map procedure which performs filtering and sorting such as sorting students by first name into queues one queue for each name and a reduce method which performs a summary operation such as counting the number of students in each queue yielding name frequencies the mapreduce system also called infrastructure or framework orchestrates the processing by marshalling the distributed servers running the various tasks in parallel managing all communications and data transfers between the various parts of the system and providing for redundancy and fault tolerance the model is a specialization of the splitapplycombine strategy for data analysis it is inspired by the map and reduce functions commonly used in functional programming although their purpose in the mapreduce framework is not the same as in their original forms the key contributions of the mapreduce framework are not the actual map and reduce functions which for example resemble the message passing interface standard's reduce and scatter operations but the scalability and faulttolerance achieved for a variety of applications by optimizing the execution engine[citation needed] as such a singlethreaded implementation of mapreduce is usually not faster than a traditional nonmapreduce implementation any gains are usually only seen with multithreaded implementations on multiprocessor hardware the use of this model is beneficial only when the optimized distributed shuffle operation which reduces network communication cost and fault tolerance features of the mapreduce framework come into play optimizing the communication cost is essential to a good mapreduce algorithm mapreduce libraries have been written in many programming languages with different levels of optimization a popular opensource implementation that has support for distributed shuffles is part of apache hadoop the name mapreduce originally referred to the proprietary google technology but has since been genericized by google was no longer using mapreduce as their primary bigdata processing model and development on apache mahout had moved on to more capable and less diskoriented mechanisms that incorporated full map and reduce capabilities"

batchsize = 50
text_words = text.split()
text_chunks = []
while text_words:
    text_chunks.append(text_words[:batchsize])
    text_words = text_words[batchsize:]