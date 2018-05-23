
#UniversalFunctionStructure
```java
// <Merge>: Merge is just a placeholder and can be replaced with any other Universal Function

// create object
<Merge> merge = new <Merge>();

// document
Document document = new Document();
byte[] file = Files.readAllBytes(Paths.get("myPdf.pdf"));
document.setDocData(file);
merge.setDocument(document);

// action
<MergeAction> mergeAction = new <MergeAction>();
// set properties
// ...
merge.<setMergeAction>(mergeAction);

// perform function action
<MergeRes> res = <MergeClient>.<merge>(merge);

// new PDF
byte[] resultingPdf = res.getDocument().getDocData();
```

#Authorization
```java
// Either you store them in the config.properties file with keys clientId and secret
// Do not use any quotes:
// Correct: clientId=sample-not-working-key-aaaaaaa
// Incorrect: clientId="sample-not-working-key-aaaaaaa"
Pdf4meClient pdf4meClient = new Pdf4meClient();

// or you pass them as arguments when constructing the Pdf4meClient object
Pdf4meClient pdf4meClient = new Pdf4meClient(clientId, secret);

// The pdf4meClient object delivers the necessary authentication when instantiating the different pdf4meClients such as for instance Merge
MergeClient mergeClient = new MergeClient(pdf4meClient);
byte[] file1 = Files.readAllBytes(Paths.get("myFirstPdf.pdf"));
byte[] file2 = Files.readAllBytes(Paths.get("mySecondPdf.pdf"));
byte[] mergedPdf = mergeClient.merge2Pdfs(file1, file2);
```

<!-- ---------------------------------------------------------Convert----------------------------------------------------------->

#Convert/ConvertToPdf
```java
// setup the convertClient
ConvertClient convertClient = new ConvertClient(pdf4meClient);

// setup convertToPdf object
ConvertToPdf convertToPdf = new ConvertToPdf();

// document
Document document = new Document();
byte[] file = Files.readAllBytes(Paths.get("myWordDoc.docx"));
document.setDocData(file);
document.setName("myWordDoc.docx");
convertToPdf.setDocument(document);

// action
ConvertToPdfAction convertToPdfAction = new ConvertToPdfAction();
convertToPdf.setConvertToPdfAction(convertToPdfAction);

// conversion
ConvertToPdfRes res = convertClient.convertToPdf(convertToPdf);

// extract generated PDF
byte[] generatedPdf = res.getDocument().getDocData();
```

#Convert/ConvertFileToPdf
```java
// setup the convertClient
ConvertClient convertClient = new ConvertClient(pdf4meClient);

// document
String fileName = "myWordDoc.docx";
byte[] file = Files.readAllBytes(Paths.get(fileName));

// generated PDF
byte[] generatedPdf = convertClient.convertFileToPdf(file, fileName);
```

<!-- ---------------------------------------------------------Extract----------------------------------------------------------->

#Extract/Extract
```java
// setup the extractClient
ExtractClient extractClient = new ExtractClient(pdf4meClient);

// list of pages to be extracted
List<Integer> pageNrs = Arrays.asList(1, 4);

// create extract object
Extract extract = new Extract();

// document
Document document = new Document();
byte[] file = Files.readAllBytes(Paths.get("myPdf.pdf"));
document.setDocData(file);
extract.setDocument(document);

// action
ExtractAction extractAction = new ExtractAction();
extractAction.setExtractPages(pageNrs);
extract.setExtractAction(extractAction);

// extract
ExtractRes res = extractClient.extract(extract);

// new PDF
byte[] extractedPdf = res.getDocument().getDocData();
```

#Extract/ExtractPages
```java
// setup the extractClient
ExtractClient extractClient = new ExtractClient(pdf4meClient);

// list of pages to be extracted
List<Integer> pageNrs = Arrays.asList(1, 4);

// document
byte[] file = Files.readAllBytes(Paths.get("myPdf.pdf"));

// extract
byte[] extractedPdf = extractClient.extractPages(pageNrs, file);
```

<!-- ---------------------------------------------------------Image----------------------------------------------------------->

#Image/CreateImages
```java
// setup the imageClient
ImageClient imageClient = new ImageClient(pdf4meClient);

// prepare parameters
int width = 4000;
String imagePageNr = "1";
ImageExtensionEnum imageFormat = ImageExtensionEnum.JPEG;

// create createImages object
CreateImages createImages = new CreateImages();

// document
Document document = new Document();
byte[] file = Files.readAllBytes(Paths.get("myPdf.pdf"));
document.setDocData(file);
createImages.setDocument(document);

// action
ImageAction imageAction = new ImageAction();
imageAction.setWidthPixel(width);
PageSelection pageSelection = new PageSelection();
pageSelection.addPageNrsItem(Integer.parseInt(imagePageNr));
imageAction.setImageExtension(imageFormat);
imageAction.setPageSelection(pageSelection);
createImages.setImageAction(imageAction);

// create image
CreateImagesRes res = imageClient.createImages(createImages);

// extract thumbnail
byte[] thumbnail = res.getDocument().getPages().get(0).getThumbnail();
```

#Image/CreateThumbnail
```java
// setup the imageClient
ImageClient imageClient = new ImageClient(pdf4meClient);

// prepare arguments
int width = 4000;
String imagePageNr = "1";
ImageExtensionEnum imageFormat = ImageExtensionEnum.JPEG;
byte[] file = Files.readAllBytes(Paths.get("myPdf.pdf"));

// create Thumbnail
byte[] thumbnail = imageClient.createThumbnail(width, imagePageNr, imageFormat, file);
```

<!-- ---------------------------------------------------------Merge----------------------------------------------------------->

#Merge/Merge
```java
// setup the mergeClient
MergeClient mergeClient = new MergeClient(pdf4meClient);

// create merge object
Merge merge = new Merge();

// files
byte[] file1 = Files.readAllBytes(Paths.get("myFirstPdf.pdf"));
byte[] file2 = Files.readAllBytes(Paths.get("mySecondPdf.pdf"));

// documents
List<Document> documents = new ArrayList<Document>();
Document doc1 = new Document();
Document doc2 = new Document();
doc1.setDocData(file1);
doc2.setDocData(file2);
documents.add(doc1);
documents.add(doc2);
merge.setDocuments(documents);

// action
MergeAction mergeAction = new MergeAction();
merge.setMergeAction(mergeAction);

// merge
MergeRes res = mergeClient.merge(merge);

// extract merged PDF
byte[] mergedPdf = res.getDocument().getDocData();
```

#Merge/Merge2Pdfs
```java
// setup the mergeClient
MergeClient mergeClient = new MergeClient(pdf4meClient);

// files
byte[] file1 = Files.readAllBytes(Paths.get("myFirstPdf.pdf"));
byte[] file2 = Files.readAllBytes(Paths.get("mySecondPdf.pdf"));

// merge
byte[] mergedPdf = mergeClient.merge2Pdfs(file1, file2);
```

<!-- ---------------------------------------------------------Optimize----------------------------------------------------------->

#Optimize/Optimize
```java
// setup the optimizeClient
OptimizeClient optimizeClient = new OptimizeClient(pdf4meClient);

// create optimize object
Optimize optimize = new Optimize();

// document
Document document = new Document();
byte[] file = Files.readAllBytes(Paths.get("myPdf.pdf"));
document.setDocData(file);
optimize.setDocument(document);

// action
OptimizeAction optimizeAction = new OptimizeAction();
optimizeAction.useProfile(true);
optimizeAction.profile(ProfileEnum.MAX);
optimize.setOptimizeAction(optimizeAction);

// optimize
OptimizeRes res = optimizeClient.optimize(optimize);

// extract optimized PDF
byte[] optimizedPdf = res.getDocument().getDocData();
```

#Optimize/OptimizeByProfile
```java
// setup the optimizeClient
OptimizeClient optimizeClient = new OptimizeClient(pdf4meClient);

// document
byte[] file = Files.readAllBytes(Paths.get("myPdf.pdf"));

// optimization for maximal memory size reduction (profile: max)
byte[] optimizedPdf = optimizeClient.optimizeByProfile(ProfileEnum.MAX, file);
```

<!-- ---------------------------------------------------------PdfA----------------------------------------------------------->

#PdfA/PdfA
```java
// setup the pdfAClient
PdfAClient pdfAClient = new PdfAClient(pdf4meClient);

// create createPdfA object
CreatePdfA createPdfA = new CreatePdfA();

// document
Document document = new Document();
byte[] file = Files.readAllBytes(Paths.get("myPdf.pdf"));
document.setDocData(file);
createPdfA.setDocument(document);

// action
PdfAAction pdfAAction = new PdfAAction();
pdfAAction.setCompliance(ComplianceEnum.PDFA2U);
createPdfA.setPdfAAction(pdfAAction);

// create PDF/A
CreatePdfARes res = pdfAClient.pdfA(createPdfA);

// PDF/A
byte[] pdfA = res.getDocument().getDocData();
```

#PdfA/CreatePdfA
```java
// setup the pdfAClient
PdfAClient pdfAClient = new PdfAClient(pdf4meClient);

// parameter
ComplianceEnum pdfCompliance = ComplianceEnum.PDFA2U;

// document
byte[] file = Files.readAllBytes(Paths.get("myPdf.pdf"));

// create PDF/A - only providing the file
byte[] pdfA = pdfAClient.createPdfA(file);

// create PDF/A - providing the file and the desired pdfCompliance
byte[] pdfA = pdfAClient.createPdfA(file, pdfCompliance);
```
<!-- ---------------------------------------------------------Split----------------------------------------------------------->

#Split/Split
```java
// setup the splitClient
SplitClient splitClient = new SplitClient(pdf4meClient);

// parameter
int pageNr = 2;

//create split object
Split split = new Split();

// document
Document document = new Document();
byte[] file = Files.readAllBytes(Paths.get("myPdf.pdf"));
document.setDocData(file);
split.setDocument(document);

// action
SplitAction splitAction = new SplitAction();
splitAction.setSplitAfterPage(pageNr);
split.setSplitAction(splitAction);

// split
SplitRes res = splitClient.split(split);

// extract the resulting documents
List<Document> documents = res.getDocuments();
byte[] pdf1 = documents.get(0).getDocData();
byte[] pdf2 = documents.get(1).getDocData();
```

#Split/SplitByPageNr
```java
// setup the splitClient
SplitClient splitClient = new SplitClient(pdf4meClient);

// parameter
int pageNr = 2;

// document
byte[] file = Files.readAllBytes(Paths.get("myPdf.pdf"));

// split PDF into two
List<byte[]> res = splitClient.splitByPageNr(pageNr, file);
byte[] pdf1 = res.get(0);
byte[] pdf2 = res.get(1);
```

<!-- ---------------------------------------------------------Stamp----------------------------------------------------------->

#Stamp/Stamp
```java
// setup the stampClient
StampClient stampClient = new StampClient(pdf4meClient);

// prepare parameters
String text = "EXAMPLE TEXT";
String pages = "1,4";
AlignXEnum alignX = AlignXEnum.CENTER;
AlignYEnum alignY = AlignYEnum.MIDDLE;

// create stamp object
Stamp stamp = new Stamp();

// document
Document document = new Document();
byte[] file = Files.readAllBytes(Paths.get("myPdf.pdf"));
document.setDocData(file);
stamp.setDocument(document);

// action
StampAction stampAction = new StampAction();
Text textObj = new Text();
textObj.setValue(text);
stampAction.setText(textObj);
stampAction.setAlpha(1.0); // opacity of the stamp: 1.0 for fully opaque, 0.0 for fully transparent.
stampAction.setPageSequence(pages);
stampAction.setAlignX(alignX);
stampAction.setAlignY(alignY);
stamp.setStampAction(stampAction);

// stamp
StampRes res = stampClient.stamp(stamp);

// extract stamped PDF
byte[] stampedPdf = res.getDocument().getDocData();
```

#Stamp/TextStamp
```java
// setup the stampClient
StampClient stampClient = new StampClient(pdf4meClient);

// prepare parameters
String text = "EXAMPLE TEXT";
String pages = "1,4";
AlignXEnum alignX = AlignXEnum.CENTER;
AlignYEnum alignY = AlignYEnum.MIDDLE;

// document
byte[] file = Files.readAllBytes(Paths.get("myPdf.pdf"));

// stamp
byte[] stampedPdf = stampClient.textStamp(text, pages, alignX, alignY, file);
```
